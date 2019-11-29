# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update, :adminupdate]

  def all
    @users = User.order(:id)
  end

  def adminedit
    @user = User.find(params[:format])
  end

  def adminupdate
    @user = User.find(params[:format])

    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
    end

    if @user.update(account_update_params)
      redirect_to users_all_path
    else
      render 'adminedit'
    end
  end

  def remove
    user = User.find(params[:format])
    user.destroy
 
    redirect_to users_all_path
  end

  def toggleadmin
    user = User.find(params[:format])
    user.update_attribute :admin, !user.admin
    redirect_to users_all_path
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:fname, :lname, :email, :password])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:fname, :lname, :email, :password, :current_password])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
