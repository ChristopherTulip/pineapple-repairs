class ContractorsController < ApplicationController

  def index
  end

	def show
		@jobs_finished = []
		@jobs_current = Job.where(contractor_id: current_contractor)
		@jobs_available = Job.where(contractor_id: nil)
	end


end
