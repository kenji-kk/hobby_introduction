class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]
  before_action :correct_user,   only: :destroy

  def new
    @post = current_user.posts.build if logged_in?
  end 
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿成功!"
      redirect_to new_user_path
    else
      render 'posts/new'
    end
  end
  
  def destroy
    @post.destroy
    flash[:success] = "投稿削除"
    redirect_to request.referrer || users_path
  end
  
   private

    def post_params
      params.require(:post).permit(:genre, :title, :content, )
    end
    
    def correct_user
      @post = current_user.microposts.find_by(id: params[:id])
      redirect_to users_path if @post.nil?
    end

end
