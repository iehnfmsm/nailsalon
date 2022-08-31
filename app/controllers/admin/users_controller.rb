class Admin::UsersController < ApplicationController

  before_action :if_not_admin
  before_action :find_user, only:[:destroy, :edit, :update]

  def index
    @users = User.all.where(admin: false)
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to admin_users_path
  end

  private
  
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def user_params
    params.require(:user).permit(:name, :email, :birthday, :user_memo, :admin_memo)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
