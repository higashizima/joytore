class Public::TrainingRecordsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @training_record = TrainingRecord.new
    @detail = @training_record.details.build
    @user = current_user
  end

  def create
     @training_record =current_user.training_records.new(training_record_params)
     if @training_record.save
       redirect_to user_path(id: current_user)
     else
       render :new
     end
  end
  
  def show
    @training_record = TrainingRecord.find(params[:id])
    @detail = Detail.find(@training_record.id)
    @menu = Menu.find(@detail.id)
    @post_comment = PostComment.new
  end
  
  def destroy
    training_record = TrainingRecord.find(params[:id])
    training_record.destroy
    redirect_to user_path(id: current_user)
  end

  def search
    @q = params[:q]
    @users = User.ransack(name_cont: @q).result
    @users_training_records = TrainingRecord.where(user_id: @users.pluck(:id))
    @training_records = TrainingRecord.ransack(content_cont: @q).result
    @gyms = Gym.ransack(gym_name_cont: @q).result
  end
  
  
  private
  def training_record_params
    params.require(:training_record).permit(:user_id, :content,
      details_attributes: [:id, :menu_id, :weight, :rep, :set, :_destroy])
      # .merge(user_id: current_user.id)
      # ↑の記載はcreateアクション” @training_record =current_user.training_records.new(training_record_params)”でcurrenr_user指定がなければ必要なもの
      # ※yユーザーからの入力がなくてもパラメータで運んでくることができるメソッド
  end
end
