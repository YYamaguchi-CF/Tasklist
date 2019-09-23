class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  
  def index
    @users = User.order(id: :asc).page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = '新規ユーザ登録をしました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザ登録が出来ませんでした。'
      render :new
    end
  end

  def edit
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
