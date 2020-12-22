class PostsController < ApplicationController
  before_action :authenticate_user

  def new
    @post = Post.new
  end
  
  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "ルームを登録しました"
      redirect_to post_path(@post)
    else
      render "new"
    end
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

  private
    def post_params
      params.require(:post).permit(:room_name, :room_PR, :room_price, :room_address)
    end

end
