class ToppagesController < ApplicationController
  def index
    if logged_in?
      @post = current_user.posts.build
      @posts = Post.all.order('created_at DESC').page(params[:page])
    end
  end
end
