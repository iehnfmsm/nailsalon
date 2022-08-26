class ReservationsController < ApplicationController
  def index
    if current_user.admin?
      redirect_to admin_reservations_path
    end
    if user_signed_in?
      @user_prefers = UserPrefer.where(user_id: current_user.id)
      @user = User.find(current_user.id)
    end
    @reservations = Reservation.all.where("date >= ?", Date.current).where("date < ?", Date.current >> 3).order(date: :desc)
  end

  def new
    @name = User.find(current_user.id)
    @date = params[:date].to_date
    @time = params[:time]
    @time_id = Prefer.find_by(time: @time).id
    @start_time = DateTime.parse(params[:date] + " " + @time[0,5] + " " + "JST")
    @reservation = Reservation.new
    message = Reservation.check_reservation_day(@date)
    if !!message
      redirect_to root_path, flash: { alert: message }
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      if current_user.admin == false
        redirect_to user_path(current_user.id)
      else
        redirect_to admin_reservations_path
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    user = User.find(@reservation.user_id).id
    @reservation.destroy
    if current_user.admin?
      redirect_to admin_reservation_path(user)
    else
      redirect_to user_path(user)
    end
  end


  private
  
  def reservation_params
    params.require(:reservation).permit(:user_id, :prefer_id, :date, :start_time, :remark)
  end
end
