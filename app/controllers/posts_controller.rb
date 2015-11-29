class PostsController < ApplicationController

  def index
    @posts = Post.all
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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Post has been updated"
      redirect_to(post_path(@post))
    else
      flash[:notice] = "Something is wrong with your upload!"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post has been deleted"
    redirect_to posts_path
  end
end
