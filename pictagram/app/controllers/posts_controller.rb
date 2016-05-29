class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = "Your image has been posted"
      redirect_to @post
    else
      flash[:error] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.save
      flash[:success] = "Post updated"
      redirect_to(post_path(@post))
    else
      flash[:error] = @post.errors.full_messages
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:image, :caption)
  end
end
