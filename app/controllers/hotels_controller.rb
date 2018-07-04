class HotelsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]

  def index
    @hotels = Hotel.search(params[:term]).page(params[:page]).per(10)
  end

  def show
    @hotel = Hotel.find(params[:id])
  end

  def new
    @hotel = Hotel.new
    @hotel.raiting = 0.0
    @hotel.build_location
    @hotel.rooms.build
  end

  def edit
    @hotel = Hotel.find(params[:id])
  end

  def create
    @hotel = Hotel.new(hotel_params)

    if @hotel.save
      redirect_to @hotel
    else
      render 'new'
    end
  end

  def update
    @hotel = Hotel.find(params[:id])

    if @hotel.update(hotel_params)
      redirect_to @hotel
    else
      render 'edit'
    end
  end

  #=====topfive test=====
  def topfive
    # @hotels=Hotel.highest_rated
    @hotels = Hotel.all
  end
  #=====topfive test=====

  private

  def hotel_params
    # TERM is added
    params.require(:hotel).permit(:title, :photo, :breakfast, :raiting, :term, location_attributes: %i[country state city street house], rooms_attributes: %i[id roomtype price description])
  end
end
