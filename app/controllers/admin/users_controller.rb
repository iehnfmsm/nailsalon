class Admin::UsersController < ApplicationController

  before_action :if_not_admin

  def index
    @users = User.all.where(admin: false)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

  private
  
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

end
