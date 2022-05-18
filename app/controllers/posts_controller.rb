class PostsController < ApplicationController
  def index
    @current_user = current_user
    @user = User.find(params[:user_id])
    @posts_comments = @user.posts_desc_order.includes(:comments)
  end

  def show
    @current_user = current_user
    @post = Post.find(params[:id])
  end
end
