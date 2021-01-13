class LoginController < ApplicationController
  
  def new 
  end
  
  def create
    user = User.find_by(email: params[:login][:email].downcase)
    if user&&user.autenticate(params[:login][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
  
end
