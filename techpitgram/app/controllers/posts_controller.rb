class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def new
  end

  def create
    @post = Post.create(post_params)
    redirect_to action: 'index'
  end

  def delete

  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
