class CommentsController < ApplicationController
before_action :set_post

  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to root_path }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to root_path
  end

  private

  def comment_params
    params.merge(user_id: current_user.id)
    params.require(:comment).permit(:text)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

end
