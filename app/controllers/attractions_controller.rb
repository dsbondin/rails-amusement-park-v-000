class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    get_attraction
  end

  def new
    @attraction = Attraction.new
  end

  def create
    attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(attraction)
  end

  def edit
    get_attraction
  end

  def update
    get_attraction
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private
    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end

    def get_attraction
      @attraction = Attraction.find_by(id: params[:id])
    end
end
