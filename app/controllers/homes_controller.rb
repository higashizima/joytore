class HomesController < ApplicationController
  before_action :authenticate_user!

  def top
    @training_records = current_user.gym.training_records.all
    @follower_training_records = TrainingRecord.where(user_id: [current_user.id, *current_user.following_users])
  end
end