class Public::LikesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    training_record = TrainingRecord.find(params[:training_record_id])
    current_user.likes.create(training_record_id: training_record.id)
    redirect_to request.referer
  end

  def destroy
    training_record = TrainingRecord.find(params[:training_record_id])
    like = current_user.likes.find_by(training_record_id: training_record.id)
    like.destroy
    redirect_to request.referer
  end
end
