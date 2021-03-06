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
