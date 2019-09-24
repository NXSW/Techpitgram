class CommentsController < ApplicationController
before_action :set_post

  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

end
