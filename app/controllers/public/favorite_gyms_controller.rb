class Public::FavoriteGymsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = User.find(params[:user_id])
    @favorite_gyms = @user.favorited_gyms
  end
  
  def create
    @gym = Gym.find(params[:gym_id])
    current_user.favorite_gyms.create(gym_id: @gym.id)
  end
  
  def destroy
    @gym = Gym.find(params[:gym_id])
    favorite_gym = current_user.favorite_gyms.find_by(gym_id: @gym.id)
    favorite_gym.destroy
  end
  
  
  
    private

  def favorite_gym_params
    params.require(:favorite_gym).permit(:gym_id, :user_id)
  end

end
