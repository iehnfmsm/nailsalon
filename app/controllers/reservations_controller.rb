class ReservationsController < ApplicationController
  def index
    if user_signed_in?
      @user_prefers = UserPrefer.where(user_id: current_user.id)
    end
    @reservations = Reservation.all.where("date >= ?", Date.current).where("date < ?", Date.current >> 3).order(date: :desc)
  end

  def new
    @reservation = Reservation.new()
    @day = params[:day].to_date
    @time = params[:time]

    message = Reservation.check_reservation_day(@day)
    if !!message
      redirect_to root_path, flash: { alert: message }
    end
  end

  def create
  end


  private

end
