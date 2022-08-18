class ReservationsController < ApplicationController
  def index
    if user_signed_in?
      @user_prefers = UserPrefer.where(user_id: current_user.id)
    end
  end

  def new
    
  end
end
