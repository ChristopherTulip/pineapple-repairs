class RegistrationsController < Devise::RegistrationsController

	def create
		super

		# SHOULD NOT HAVE TO DO THIS, BUT FOR SOME REASON NAME IS NOT WORKING
		@contractor.name = params[:contractor][:name]
		@contractor.phone_number = params[:contractor][:phone_number]
		

		# locations = params
		city = params[:contractor][:location][:city].downcase
		country = params[:contractor][:location][:country].downcase

		location = Location.where(city: city, country: country).first


		if location.nil?
			location = Location.create(city: city, country: country)
		end

		@contractor.location = location
		location.save
		@contractor.save

		
	end

end
