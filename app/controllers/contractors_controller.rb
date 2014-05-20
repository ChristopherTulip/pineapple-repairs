class ContractorsController < ApplicationController

	def show
		@jobs_finished = Job.all
		@jobs_current = Job.all
		@jobs_available = Job.all

	end
end
