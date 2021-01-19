class BulletinBoardsController < ApplicationController
  def create
    @post = Post.find(params[:id])
    @board = @post.bulletin_boards.build(board_params)
    if @board.save
      redirect_to post_path(@board.post.id)
    end
  end
  
   private

   def board_params
      params.require(:bulletin_board).permit(:name, :content)
   end
end
