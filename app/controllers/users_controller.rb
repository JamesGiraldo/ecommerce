class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :setiar_user, only: [:ver_datos]
  before_action :set_user, only: %i[edit show cambiar_password update_password update]
  respond_to :html, :json

  def index
    @users = User.all
    if params[:q].present?
      @users = @users.where('email ilike :q or name ilike :q', q: "%#{params[:q]}%")
    end
  end

  def show; end

  def ver_datos
    render template: 'users/show'
  end

  def edit; end

  def cambiar_password; end

  def update_password
    if current_user.update_with_password(user_params)
      bypass_sign_in(current_user)
      redirect_to '/' , notice: "Contraseña Actualizada"
    else
      render 'cambiar_password' , alert: "Problemas Con La Grabacion"
    end
  end

  def update
    if current_user.update(user_params)
      redirect_to edit_user_path , notice: "Datos Actualizados"
    else
      render :edit , alert: "Problemas Con la Grabacion"
    end
  end

  private

  def set_user
    @user = current_user
  end

  def setiar_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password,
                                 :current_password, :password_confirmation,
                                 :name, :last_name,
                                 :age, :state,
                                 :city, :colony,
                                 :street, :uid, :provider,
                                 :perfil, :permission_level)
  end
end
