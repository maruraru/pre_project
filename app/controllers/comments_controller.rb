class CommentsController < ApplicationController
  before_action :authenticate_user!

  before_action :curr_hotel, only: %i[create destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.hotel_id = @hotel.id
    redirect_to hotel_path(@hotel) if @comment.save
  end

  def destroy
    @comment = @hotel.comments.find(params[:id])
    @comment.destroy
    redirect_to hotel_path(@hotel)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :localrate)
  end

  def curr_hotel
    @hotel = Hotel.find(params[:hotel_id])
  end
end
