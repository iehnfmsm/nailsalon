class Admin::ReservationsController < ApplicationController

  before_action :if_not_admin

  def index
    @reservations = Reservation.all.where("date >= ?", Date.current).where("date < ?", Date.current >> 3).order(date: :asc)
  end

  def new
    @reservation = Reservation.new
    @date = params[:date].to_date
    @time = params[:time]
    @time_id = Prefer.find_by(time: @time).id
    @start_time = DateTime.parse(params[:date] + " " + @time[0,5] + " " + "JST")
    message = Reservation.check_reservation_day(@date)
    if !!message
      redirect_to admin_reservations_path, flash: { alert: message }
    end
  end

  def show
    @user = User.find(params[:id])
    @reservations = Reservation.all.where(user_id: @user.id).where("date >= ?", Date.current).where("date < ?", Date.current >> 3).order(date: :asc)
  end

private

  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

end
