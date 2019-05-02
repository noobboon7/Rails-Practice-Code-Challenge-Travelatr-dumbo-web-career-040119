class PostsController < ApplicationController
  before_action :get_post, only: [:show, :edit, :update]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @blogger = Blogger.all
    @destination = Destination.all
  end

  def create
    @post = Post.create(post_params)
    if @post.valid?
      redirect_to @post
    else
      render :new
    end
  end


  def update
    @post.update(post_params)
    if @post.valid?
      redirect_to post_path@post
    else
      render :edit
    end
  end

  private

  def get_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
  end

end
