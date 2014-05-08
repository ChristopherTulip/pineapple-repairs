class JobsController < ApplicationController

  def show
  end

  def new
    @job = Job.new( current_user.id, params[:job] )

    if @job.valid?
      if @job.last_step? && @job.all_valid?
        if @job.save! current_user, params[:job][:attached_document]
          Job.clear_wizard(id)
          return
        end
      else
        Job.save_unfinished_object(
          id, @job.attributes.merge(current_step: @job.next_step)
        )
      end
    end

    render :new

  end

  def create
  end

end


