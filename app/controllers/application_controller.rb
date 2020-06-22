class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configuraciones
 protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up) do |user_params|
     user_params.permit(:name, :last_name, :age, :state, :email, :city, :colony,
                        :street, :uid, :provider, :password,
                        :password_confirmation, :permission_level, :perfil)
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    if user_signed_in?
      redirect_to root_path, alert: exception.message
    else
      redirect_to new_user_session_path, alert: exception.message
    end
  end

  def configuraciones
    @categories = Category.all
  end
end
