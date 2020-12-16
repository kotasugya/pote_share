class PostsController < ApplicationController
  before_action :authenticate_user

  def new
    @post = Post.new
  end
  
  def show
  end

  def create
  end

  def index
    @posts = Post.all
  end

  def edit
  end
  
  def update
  end

  def destroy
  end

end
