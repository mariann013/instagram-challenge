class PostsController < ApplicationController

  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:notice] = "Your post has been uploaded successfully!"
      redirect_to @post
    else
      flash[:notice] = "Please upload an image with your post!"
      render :new
    end
  end

  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def show
    @post = Post.find(params[:id])
  end

end
