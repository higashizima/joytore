class Public::FavoriteGymsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @favorite_gyms = current_user.favorited_gyms
  end
  
  def create
    gym = Gym.find(params[:gym_id])
    current_user.favorite_gyms.create(gym_id: gym.id)
    redirect_to request.referer
  end
  
  def destroy
    gym = Gym.find(params[:gym_id])
    favorite_gym = current_user.favorite_gyms.find_by(gym_id: gym.id)
    favorite_gym.destroy
    redirect_to request.referer
  end
end
