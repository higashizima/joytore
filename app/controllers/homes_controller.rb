class HomesController < ApplicationController
  def top
    @current_users_gym = current_user.gym
    @training_records = @current_users_gym.training_records.all
  end
end
