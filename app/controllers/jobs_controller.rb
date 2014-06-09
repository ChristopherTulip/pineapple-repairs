class JobsController < ApplicationController
  before_filter :redirect_if_not_authenticated, except: [:new, :create, :unavailable]
  before_filter :redirect_if_not_verified, except: [:new, :create, :unavailable]

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    @data = Device.all
  end

  def index
  end

  def create
    @job = create_job_from_cookie

    assign_params @job

    @job.next_state params[:back]

    if @job.current_step == "device" && @job.device_id.present? && !params[:back]
      @job.next_state params[:back]
    end

    @data = @job.data_for_step @job.device_id

    if !@job.new_record?
      cookies.delete(:job)

      UserMailer.job("created", "customer", @job)
      UserMailer.job("created", "contractor", @job)

      redirect_to root_path, notice: "Job Successfully Created - Our technicians will be in touch soon"
    elsif @job.current_step == "location" && @job.location.nil? && params[:job].present?
      cookies.delete(:job)
      redirect_to unavailable_jobs_path
    else
      cookies[:job] = YAML::dump @job.attributes.merge( "current_step" => @job.current_step )
      render :new
    end
  end

  def unavailable
  end

  def accept
    @job = Job.find(params[:id])
    @job.contractor = Contractor.find(params[:contractor_id])
    @job.save

    UserMailer.job("accepted", "customer", @job)

    redirect_to contractor_path(params[:contractor_id])
  end

  def finish
    @job = Job.find(params[:id])

    UserMailer.job("closed", "customer", @job)

    if @job.contractor == current_contractor
      @job.finished = true
      @job.save
    end

    redirect_to contractor_path(params[:contractor_id])
  end

  def current
    @jobs = current_contractor.unfinished_jobs

    @title = "current"

    render "job_list"
  end

  def finished
    @jobs = current_contractor.finished_jobs

    @title = "finished"

    render "job_list"
  end

  def available
    @jobs = Job.available.where(location: current_contractor.location)

    @title = "available"

    render "job_list"
  end

private

  def create_job_from_cookie
    if params[:restart]
      cookies.delete(:job)
    end

    cookies[:job].present? ? Job.new( YAML::load( cookies[:job] ) ) : Job.new
  end

  def assign_params job
    case job.current_step
    when "device"
      job.device_id = params[:device_id]
    when "model"
      job.model_id = params[:model_id]
    when "network"
      job.network_id = params[:network_id]
    when "problem"
      job.problem_id = params[:problem_id]
    when "location"
      if params[:device_id].present?
        job.device_id = params[:device_id]
      end

      if params[:job] && params[:job][:location].present?
        location = Location.where( city: params[:job][:location][:city].downcase )

        if ( params[:job][:location][:country].present? )
          location.where( country: params[:job][:location][:country].downcase )
        end

        job.location = location.first
      end
    when "contact"
      if params[:job]
        job.name = params[:job][:name]
        job.email = params[:job][:email]
        job.phone_number = params[:job][:phone_number]
      end
    else
      raise "should never end up here"
    end
  end
end
