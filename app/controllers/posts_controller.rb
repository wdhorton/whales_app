require_relative 'application_controller'
require_relative '../models/user.rb'
require_relative '../models/post.rb'

class PostsController < ApplicationController

  def index
    @posts = Post.all
    path = File.expand_path("../../assets/stylesheets/post_index.css", __FILE__)
    @css = File.read(path)

    render :index
  end

  def new
    path = File.expand_path("../../assets/stylesheets/post_index.css", __FILE__)
    @css = File.read(path)

    render :new
  end

  def create
    @post = Post.new(params[:post])
    @post.user_id = current_user.id

    if @post.save
      redirect_to "users/#{@post.user_id}"
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
