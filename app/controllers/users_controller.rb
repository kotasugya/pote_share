class UsersController < ApplicationController
  before_action :authenticate_user, only: [:edit, :update, :show]

  def new
    @user = User.new
  end
 
  def myrooms
    @user = User.find(params[:id])
    @posts = @user.post
  end

  def create
    @user = User.new(user_params)
    @user.image_name = "default_icon.jpg"
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "ユーザー登録が完了しました"
      redirect_to user_path(@user)
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "登録情報を更新しました"
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
      flash[:success] = "ログインしました"
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      render "login_form"
    end
  end

  def logout
    session[:user_id] = nil
    flash[:success] = "ログアウトしました"
    redirect_to login_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confrimation, :image_name)
    end
end
