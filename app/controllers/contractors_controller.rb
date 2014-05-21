class ContractorsController < ApplicationController

  def index
  end

	def show
		@jobs_finished = current_contractor.finished_jobs
		@jobs_current = current_contractor.unfinished_jobs
		@jobs_available = Job.available
	end
end
