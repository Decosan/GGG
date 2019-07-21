class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] ='Logged in!!'
      redirect_to root_path
    else
      flash.now[:danger] ='Failed..'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:danger] ='Logout!!'
    redirect_to login_path
  end
end
