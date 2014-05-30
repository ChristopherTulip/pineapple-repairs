class RegistrationsController < Devise::RegistrationsController

	def create
		super
		
		@contractor.name = params[:contractor][:name]
		@contractor.phone_number = params[:contractor][:phone_number].gsub(/\D/, '')[0..9]
		@contractor.password = params[:contractor][:password]
		
		city = params[:contractor][:location][:city]
		country = params[:contractor][:location][:country]

		location = Location.where(city: city, country: country).first
		location = Location.create(city: city, country: country) if location.nil?

		@contractor.location = location

		if @contractor.save
			# respond_with @contractor, :location => contractors_path
			flash.now[:notice] = "Thanks for creating an account, we will review and verify your account shortly."
			#redirect_to root_path, notice: "Thanks for registering as a contractor - we'll be in touch shortly"
			return
		end

	end
end
