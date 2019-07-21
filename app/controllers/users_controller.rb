class UsersController < ApplicationController
  before_action :require_user_login, only:[:index,:show]

  def index
    @users = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @posts = current_user.posts.order('created_at DESC').page(params[:page])
    count(@user)
  end

  def likings
    @user = User.find(params[:id])
    @posts = Post.all.order('created_at DESC').page(params[:page])
    count(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] ='Signed up!!'
      redirect_to users_path
      # new_session_path
    else
      flash.now[:danger] ='Failed..'
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
