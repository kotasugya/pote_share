class PostsController < ApplicationController
  before_action :authenticate_user

  def new
    @post = Post.new
  end
  
  def show
  end

  def create
  end

  def search
    @posts = Post.search(params[:search])
  end

  def edit
  end
  
  def update
  end

  def destroy
  end

end
