class AttractionsController < ApplicationController

  def new
    @attraction = Attraction.new
  end

  def create

  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def edit
    #code
  end

  def update
    # Creates a new ride - DOES NOT EDIT Attraction
    @user = User.find(session[:user_id])
    @attraction = Attraction.find(params[:id])
    @ride = Ride.new(user_id: @user.id, attraction_id: @attraction.id)
    flash[:notice] = @ride.take_ride
    redirect_to @user
  end

  def index
    @attractions = Attraction.all
    @user = User.find(session[:user_id])
  end

  private

end
