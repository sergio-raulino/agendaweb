class UsersController < ApplicationController
  def index
    @users = User.order(:email).page(params[:page]).per(10)
  end

  def show
     @user = User.find(params[:id])
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
