class RegistrationsController < Devise::RegistrationsController

	def create
		super
	end

	def build_resource hash
		super( hash )

		resource.name = params[:contractor][:name]
		resource.phone_number = params[:contractor][:phone_number].gsub(/\D/, '')[0..9]


		city = params[:contractor][:location][:city].downcase
		country = params[:contractor][:location][:country].downcase

		location = Location.where(city: city, country: country).first
		location = Location.create(city: city, country: country) if location.nil?

		resource.location = location
	end
end
