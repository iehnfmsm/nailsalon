class UsersController < ApplicationController

  def show
    if user_signed_in?
      @user_prefers = UserPrefer.all.where(user_id: current_user.id)
      @reservations = Reservation.all.where(user: current_user.id).where("date >= ?", Date.current).where("date < ?", Date.current >> 3).order(date: :asc)
    else
      redirect_to root_path
    end
  end
end
