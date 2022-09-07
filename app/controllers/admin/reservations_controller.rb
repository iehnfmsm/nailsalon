class Admin::ReservationsController < ApplicationController

  before_action :if_not_admin

  def index
      @reservations = Reservation.all.where("date >= ?", Date.current).where("date < ?", Date.current >> 6).order(date: :asc)
      if params[:start_date] == nil
        params[:start_date] = Date.today
      end
      search_date
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
    @reservations = Reservation.all.where(user_id: @user.id).where("date >= ?", Date.current).where("date < ?", Date.current >> 6).order(date: :asc)
  end

private

  def if_not_admin
    redirect_to root_path unless user_signed_in? && current_user.admin?
  end

  def search_date
    if params["start_date(1i)"] != nil && params["start_date(2i)"] != nil && params["start_date(3i)"] != nil
      params[:start_date] = Date.new params["start_date(1i)"].to_i, params["start_date(2i)"].to_i, params["start_date(3i)"].to_i
      params["start_date(1i)"] = nil
      params["start_date(2i)"] = nil
      params["start_date(3i)"] = nil
    end
  end
end
