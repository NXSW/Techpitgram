class CommentsController < ApplicationController
before_action :set_post

  def create
    comment = @post.comments.new(text: comment_params[:text], user_id: current_user.id)
    redirect_to root_path if comment.save
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render json: { id: @comment.id }
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

end
