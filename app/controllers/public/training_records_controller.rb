class Public::TrainingRecordsController < ApplicationController
  before_action :authenticate_user!, except: [:top]

  def new
    @training_record = TrainingRecord.new
    @detail = @training_record.details.build
  end

  def create
     @training_record = TrainingRecord.new(training_record_params)
     if @training_record.save
       redirect_to users_my_page_path(id: current_user)
     else
       render :new
     end

  end

  def edit
    @training_record = TrainingRecord.find(params[:id])

  end


  private
  def training_record_params
    params.require(:training_record).permit(:user_id, :content,
      details_attributes: [:id, :menu_id, :weight, :rep, :set, :_destroy])
      .merge(user_id: current_user.id)
  end
end
