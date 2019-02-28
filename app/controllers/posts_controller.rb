class PostsController < ApplicationController


  def index
    @posts = Post.all
  end

  def new
    @posts = Post.new(post_params)
  end

  def create
    @posts = Post.create(post_params)
    redirect_to posts_path(@posts)
  end

  def show
    get_post
  end

  def edit
    get_post
  end

  def update
    get_post.update(post_params)
    redirect_to posts_path(@posts)
  end

  def destroy
    get_post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(@posts).permit(:name, :description)
  end

  def get_post
    @posts = Post.find(params[:id])
  end
end
