class Public::GymsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = current_user
    @gyms = Gym.all
    @favorite_gym = FavoriteGym.new
  end
  
end
