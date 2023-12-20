class Public::LikesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @training_record = TrainingRecord.find(params[:training_record_id])
    current_user.likes.create(training_record_id: @training_record.id)
  end

  def destroy
    @training_record = TrainingRecord.find(params[:training_record_id])
    like = current_user.likes.find_by(training_record_id: @training_record.id)
    like.destroy
  end
end
