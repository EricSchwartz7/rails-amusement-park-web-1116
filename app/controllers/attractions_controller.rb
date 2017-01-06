class AttractionsController < ApplicationController

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to @attraction
    else
      render :new
    end
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    # Creates a new ride - DOES NOT EDIT Attraction

  end

  def go_on_ride
    @user = User.find(session[:user_id])
    @attraction = Attraction.find(params[:id])
    @ride = Ride.new(user_id: @user.id, attraction_id: @attraction.id)
    flash[:notice] = @ride.take_ride
    redirect_to @user
  end

  def index
    @attractions = Attraction.all
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :min_height,
    :happiness_rating, :nausea_rating)
  end

end
