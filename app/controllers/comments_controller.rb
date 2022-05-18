class CommentsController < ApplicationController
  def new
    @current_user = current_user
    @post = Post.find(params[:post_id])
    render :new, locals: { user: @current_user, post: @post }
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.post = @post
    if @comment.save
      flash[:success] = 'Your comment saved successfully'
      redirect_to user_post_url(@post.user.id, @post.id)
    else
      flash.now[:error] = @comment.errors.full_messages.to_sentence
      render :new, locals: { post: @post }, status: 422
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
