class CommentsController < ApplicationController

  before_action :authenticate_user!

  def new
  	@comment = Comment.new
  end

  def create
    @hotel = Hotel.find(params[:hotel_id])
    @comment = current_user.comments.build(comment_params)
    @comment.hotel_id = @hotel.id
    redirect_to hotel_path(@hotel) if @comment.save
  end

  def destroy
  end


  # def create
   # @hotel = Hotel.find(params[:article_id])
   # @comment = @hotel.comments.create(comment_params)
   # current_user.comment=@comment
   # comment
   # redirect_to hotel_path(@hotel)
  #end
 
  private
    def comment_params
      params.require(:comment).permit(:comment, :localrate)
    end
end