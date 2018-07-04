class RoomsController < ApplicationController

  before_action :authenticate_user!

  before_action :get_curr_hotel, only: [:create,:destroy]
  
  def new
  	@room = Room.new
  end

  def create
    #@hotel = Hotel.find(params[:hotel_id])
    @room = @hotel.rooms.build(room_params)
    redirect_to hotel_path(@hotel) if @room.save
  end

  def destroy
    #@hotel = Hotel.find(params[:hotel_id])
    @room = @hotel.rooms.find(params[:id])
    @room.destroy
    redirect_to hotel_path(@hotel)
  end
 
  private
    def room_params
      params.require(:room).permit(:roomtype, :price, :description)
    end


    def get_curr_hotel 
      @hotel = Hotel.find(params[:hotel_id])
    end
	
end