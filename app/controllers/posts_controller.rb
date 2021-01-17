class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]

  def new
    @post = current_user.posts.build if logged_in?
  end 
  
  def create
    @post = current_user.microposts.build(post_params)
    if @post.save
      flash[:success] = "投稿成功!"
      redirect_to new_user_path
    else
      render 'posts/new'
    end
  end
  
   private

    def post_params
      params.require(:post).permit(:genre, :title, :content, )
    end

end
