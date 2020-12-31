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
    @post.image.attach(params[:post][:image])
    if @post.save
      flash[:success] = "ルームを登録しました"
      redirect_to post_path(@post)
    else
      render "new"
    end
  end

  def search
    @posts = Post.search_area(params[:search_area])
    @posts = Post.search_keyword(params[:search_keyword])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def post_params
      params.require(:post).permit(:room_name, :room_PR, :room_price, :room_address, :image).merge(user_id: @current_user.id)
    end

end
