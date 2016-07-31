class ApplicationController < ActionController::Base


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

 protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) << :name
   devise_parameter_sanitizer.for(:account_update) << :name
   devise_parameter_sanitizer.for(:sign_up) << :address_line_1
   devise_parameter_sanitizer.for(:account_update) << :address_line_1
   devise_parameter_sanitizer.for(:sign_up) << :address_line_2
   devise_parameter_sanitizer.for(:account_update) << :address_line_2
   devise_parameter_sanitizer.for(:sign_up) << :city
   devise_parameter_sanitizer.for(:account_update) << :city
   devise_parameter_sanitizer.for(:sign_up) << :state
   devise_parameter_sanitizer.for(:account_update) << :state
   devise_parameter_sanitizer.for(:sign_up) << :zip_code
   devise_parameter_sanitizer.for(:account_update) << :zip_code
   devise_parameter_sanitizer.for(:sign_up) << :avatar
   devise_parameter_sanitizer.for(:account_update) << :avatar
   devise_parameter_sanitizer.for(:sign_up) << :terms_and_conditions
   devise_parameter_sanitizer.for(:account_update) << :terms_and_conditions
   devise_parameter_sanitizer.for(:sign_up) << :user_description
   devise_parameter_sanitizer.for(:account_update) << :user_description


 end
end
