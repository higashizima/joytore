class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  # def index
  #   @user = User.where(is_activ: "true")
  # end

  def show
    @user = User.find(params[:id])
    @users_gym =Gym.find(@user.gym_id)
    @training_records = @users_gym.training_records.all
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_paramas)
      redirect_to user_path(id: current_user), notice: "マイページを変更しました。"
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:gim_id, :name, :description, :profile_image)
  end

end
