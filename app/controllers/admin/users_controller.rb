class Admin::UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @training_records = @user.training_records
    @users_gym = @user.gym
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end
  
  
  private

  def user_params
    params.require(:user).permit(:is_active)
  end
end
