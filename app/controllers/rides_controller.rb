class RidesController < ApplicationController

  def ride
    ride = Ride.create(user_id: current_user.id, attraction_id: params[:id])
    flash[:notice] = ride.take_ride
    redirect_to user_path(current_user)
  end

end
