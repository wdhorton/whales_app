require_relative 'application_controller'
require_relative '../models/user.rb'
require_relative '../models/post.rb'

class PostsController < ApplicationController

  def index
    @posts = Post.all
    render :index
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def new
    render :new
  end

  def create
    @post = Post.new(params[:post])
    @post.user_id = current_user.id

    if @post.save
      redirect_to "posts/#{@post.id}"
    else
      flash.now[:errors] = ["Unable to make your post"]
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(params[:post])
      redirect_to "posts/#{@post.id}"
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

end
