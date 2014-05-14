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
    if cookies[:job].present?
      @job = Job.new( YAML::load( cookies[:job] ) )
    else
      @job = Job.new
    end

    @data = @job.data_for_step @job.device_id

    if @job.step?(0)
      @job.device_id = params[:device_id]
    elsif @job.step?(1)
      @job.model_id = params[:model_id]
    elsif @job.step?(2)
      @job.problem_id = params[:problem_id]
    elsif @job.step?(3)

    end

    @job.next_state params[:back]

    if @job.current_step.nil?
      cookies.delete(:job)
      redirect_to root_path, notice: "Job Successfully Created - Our Technicians Will be in touch soon"
    else
      cookies[:job] = YAML::dump @job.attributes.merge( "current_step" => @job.current_step )
      render :new
    end
  end
end
