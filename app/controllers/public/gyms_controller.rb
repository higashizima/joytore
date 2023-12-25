class Public::GymsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = current_user
    @gyms = Gym.where(is_open: "true")
    @favorite_gym = FavoriteGym.new
  end
  
end
