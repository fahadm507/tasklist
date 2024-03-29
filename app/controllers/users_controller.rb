class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @task = Task.new
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to users_path
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You are registered"
      redirect_to '/users'
    else
      flash[:notice] ="your input is invalid"
      render new
    end

  end

  private

  def
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name)
  end
end
