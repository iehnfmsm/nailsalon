class Admin::ReservationsController < ApplicationController

  before_action :if_not_admin

  def index
    @reservations = Reservation.all.where("date >= ?", Date.current).where("date < ?", Date.current >> 3).order(date: :asc)
  end


private

def if_not_admin
  redirect_to root_path unless current_user.admin?
end

end
