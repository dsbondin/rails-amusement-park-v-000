class RidesController < ApplicationController

  def ride
    # raise params.inspect
    ride = Ride.create(user_id: current_user.id, attraction_id: params[:id])
    # raise ride.inspect
    ride.take_ride
    redirect_to user_path(current_user)
  end

end
