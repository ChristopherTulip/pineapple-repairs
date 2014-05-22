class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def redirect_if_not_authenticated
    retidrect_to root_path unless current_contractor.present?
  end

  def redirect_if_not_verified
    unless current_contractor.verified
      redirect_to root_path, notice: "Sorry you can't access this area until your profile has been verified!"
    end
  end

end
