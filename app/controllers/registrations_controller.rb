class RegistrationsController < Devise::RegistrationsController

	def create
		@contractor_params= contractor_params
		build_resource(sign_up_params)

		resource.name = @contractor_params[:name]
		resource.phone_number = @contractor_params[:phone_number].gsub(/\D/, '')[0..9]

		city = @contractor_params[:location][:city].downcase
		country = @contractor_params[:location][:country].downcase

		location = Location.where(city: city, country: country).first
		location = Location.create(city: city, country: country) if location.nil?
		resource.location = location

		resource.save

    resource_saved = resource.save
    yield resource if block_given?
    if resource_saved
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
	end

	private

	def contractor_params
		params.require(:contractor).permit(:name,
																			 :email,
																			 :password,
																			 :password_confirmation,
																			 :phone_number,
																			 {location: [
																			 		:city,
																			 		:country]
																			 }
																			 )

	end
end

