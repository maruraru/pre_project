class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :curr_hotel, only: %i[create destroy]

  def new
    @room = Room.new
  end

  def create
    @room = @hotel.rooms.build(room_params)
    redirect_to edit_hotel_path(@hotel)
  end

  def destroy
    @room = @hotel.rooms.find(params[:id])
    @room.destroy
    redirect_to edit_hotel_path(@hotel)
  end

  private

  def room_params
    params.require(:room).permit(:roomtype, :price, :description)
  end

  def curr_hotel
    @hotel = Hotel.find(params[:hotel_id])
  end
end
