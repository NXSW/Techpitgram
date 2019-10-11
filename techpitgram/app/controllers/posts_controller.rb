class PostsController < ApplicationController
  before_action :set_post, only: [:destroy]
  before_action :authorize_post, only: [:index, :new, :create]

  def index
    @posts = Post.all
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(caption: post_params[:caption], image: post_params[:image], user_id: current_user.id)
    redirect_to action: 'index'
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to action: 'index'
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def set_post
    @post = Post.find_by(params[:post_id])
    authorize @post
  end

  def authorize_post
    authorize Post
  end

end
