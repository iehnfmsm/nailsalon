# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

   def new
     super
     @user_form = UserForm.new
   end

  # POST /resource
  def create
    if params[:user_prefer] != nil
      super
      if user_signed_in?
        params[:user_prefer][:prefer_ids].each do |prefer|
          UserPrefer.create(user_id: current_user.id, prefer_id: prefer)
        end
      end
    else
      #resource.errors.full_messages = "希望日時を日時を選択してください"
      #render :new
      redirect_to new_user_registration_path
    end
  end

  private

  def user_form_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :birthday)
  end
  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
