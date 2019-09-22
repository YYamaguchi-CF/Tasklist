class UsersController < ApplicationController
  def index
    @users = User.order(id: :asc).page(params[:page]).per(10)
  end

  def show
  end

  def new
  end

  def edit
  end
end
