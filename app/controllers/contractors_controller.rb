class ContractorsController < ApplicationController
  before_filter :redirect_if_not_admin, only: [:index]
  before_filter :redirect_if_not_verified, execpt: [:verify]

  def index
    @contractors = Contractor.all
  end

	def show
		@jobs_finished = current_contractor.finished_jobs
		@jobs_current = current_contractor.unfinished_jobs
		@jobs_available = Job.available
	end

  def verify
    @contractor = Contractor.find(params[:id])
    @contractor.verified = true
    @contractor.save

    redirect_to contractors_path, notice: "Contractor Successfully Verified"
  end

private
  def redirect_if_not_admin
    unless current_contractor.admin
      redirect_to contractor_path(current_contractor), notice: "Sorry this is an admin only area!"
    end
  end
end
