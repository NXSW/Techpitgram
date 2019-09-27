class LikesController < ApplicationController
before_action :set_variables

  def like
    like = current_user.likes.create(post_id: @post.id)
  end

  def unlike
    like = current_user.likes.find_by(post_id: @post.id)
    like.destroy
  end

  private

  def set_variables
    @post = Post.find(params[:post_id])
  end
end
