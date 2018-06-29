class HotelsController < ApplicationController
	
	#before_filter :authenticate_user!, except => [:show, :index]


	def index
		@hotels = Hotel.all.page(params[:page]).per(10)
	end


	def show
    	@hotel = Hotel.find(params[:id])
  	end


	def new
		@hotel = Hotel.new
		@hotel.raiting=0.0;
		@hotel.build_location
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


	private
  	def hotel_params
   		params.require(:hotel).permit(:title, :photo, :breakfast, :raiting, location_attributes: [:country, :state, :city, :street, :house])
  	end
end