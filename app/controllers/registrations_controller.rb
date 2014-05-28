class RegistrationsController < Devise::RegistrationsController

	def create
		super

		@contractor.name = params[:contractor][:name]
		@contractor.phone_number = params[:contractor][:phone_number]
		@contractor.password = params[:contractor][:password]

		# locations = params
		city = params[:contractor][:location][:city].downcase
		country = params[:contractor][:location][:country].downcase

		location = Location.where(city: city, country: country).first
		location = Location.create(city: city, country: country) if location.nil?

		@contractor.location = location

		if @contractor.save
			redirect_to root_path, notice: "Thanks for registering as a contractor - we'll be in touch shortly"
		end
	end
end
