class Public::PostCommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    training_record = TrainingRecord.find(params[:training_record_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.training_record_id = training_record.id
    comment.save
    redirect_to request.referer
  end
  
  def destroy
    # アラートview
    PostComment.find(params[:id]).destroy
    redirect_to request.referer
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
