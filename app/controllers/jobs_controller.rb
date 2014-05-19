class JobsController < ApplicationController

  def show
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

    @data = @job.data_for_step @job.device_id

    if @job.current_step.nil?
      cookies.delete(:job)
      redirect_to root_path, notice: "Job Successfully Created - Our technicians will be in touch soon"
    elsif @job.current_step == "location" && @job.location.nil?
      redirect_to unavailable_jobs_path
    else
      cookies[:job] = YAML::dump @job.attributes.merge( "current_step" => @job.current_step )
      render :new
    end
  end

  def unavailable
  end

private

  def create_job_from_cookie
    if params[:restart]
      cookies.delete(:job)
    end

    cookies[:job].present? ? Job.new( YAML::load( cookies[:job] ) ) : Job.new
  end

  def assign_params job
    if job.step?(0)
      job.device_id = params[:device_id]
    elsif job.step?(1)
      job.model_id = params[:model_id]
    elsif job.step?(2)
      job.network_id = params[:network_id]
    elsif job.step?(3)
      job.problem_id = params[:problem_id]
    elsif job.step?(4)
      location = Location.where(city: params[:job][:location][:city])

      if ( params[:job][:location][:city].present? )
        location.where( city: params[:job][:location][:city] )
      end

      job.location = location.first

    end
  end

end
