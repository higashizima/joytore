class Admin::TrainingRecordsController < ApplicationController
  
  def show
    @training_record = TrainingRecord.find(params[:id])
    @detail = Detail.find(@training_record.id)
    @menu = Menu.find(@detail.id)
  end
  
  def update
    @training_record = TrainingRecord.find(params[:id])
    @training_record.update(training_record_params)
    redirect_to  admin_training_record_path(@training_record)
  end
  
  
  private
  def training_record_params
    params.require(:training_record).permit(:user_id, :content,
      details_attributes: [:id, :menu_id, :weight, :rep, :set, :_destroy])
      # .merge(user_id: current_user.id)
      # ↑の記載はcreateアクション” @training_record =current_user.training_records.new(training_record_params)”でcurrenr_user指定がなければ必要なもの
      # ※ユーザーからの入力がなくてもパラメータで運んでくることができるメソッド
  end
  
end
