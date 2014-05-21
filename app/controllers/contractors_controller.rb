class ContractorsController < ApplicationController

  def index
  end

	def show
		@jobs_finished = Job.all
		@jobs_current = Job.all
		@jobs_available = Job.all
	end


end
