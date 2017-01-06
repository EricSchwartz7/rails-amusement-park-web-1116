class RidesController < ApplicationController

  def create
    @user = User.find(session[:user_id])
    @attraction = Attraction.find(params[:attraction_id])
    @ride = Ride.new(user_id: @user.id, attraction_id: @attraction.id)
    flash[:notice] = @ride.take_ride
    redirect_to @user
  end
end
