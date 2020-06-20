class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

 protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up) do |user_params|
     user_params.permit(:name, :last_name, :age, :state, :email, :city, :colony,
                        :street, :uid, :provider, :password,
                        :password_confirmation, :permission_level)
    end
  end
end
