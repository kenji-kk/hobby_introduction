class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show,]
  before_action :correct_user,   only: [:edit, :update]
  
  def index
    @feed_items = current_user.feed.paginate(page: params[:page]) if logged_in?
  end

  def show
     @user = User.find(params[:id])
     @microposts = @user.posts.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end 

  def edit
    @user = User.find(params[:id])
  end
  
  def manyusers
    @users = User.paginate(page: params[:page])
  end
  
 private

   def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
   end
end 
  
