class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def new
  end

  def create
    Post.create(caption: params[:caption], image: params[:image])
  end

  def delete
    
  end
end
