class PostsController < ApplicationController
  def index
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] ='Post made!!'
      redirect_to root_path
    else
      flash.now[:danger] ='Failed..'
      render 'toppages/index'
    end
  end

  def edit
    @post=current_user.posts.find_by(id: params[:id])
  end

  def update
    @post=current_user.posts.find_by(id: params[:id])
    if @post.update(post_params)
      flash[:success] ='Edit complete!'
      redirect_to root_path
    else
      flash.now[:danger] ='Failed..'
      render 'edit'
    end
  end

  def destroy
    @post=current_user.posts.find_by(id: params[:id])
    @post.destroy
    flash[:danger] ='Post deleted!!'
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title,:content)
  end
end
