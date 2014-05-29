class ContractorsController < ApplicationController
  before_filter :redirect_if_not_authenticated
  before_filter :redirect_if_not_verified, except: [:verify]
  before_filter :redirect_if_not_admin, only: [:index]

  def index
    @contractors = Contractor.all
  end

	def show
    @contractor = Contractor.find(params[:id])
		@jobs_finished = current_contractor.finished_jobs
		@jobs_current = current_contractor.unfinished_jobs
	end

  def verify
    @contractor = Contractor.find(params[:id])
    @contractor.verified = true
    @contractor.save

    redirect_to contractors_path, notice: "Contractor Successfully Verified"
  end

end
