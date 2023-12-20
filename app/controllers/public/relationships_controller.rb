class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:user_id])
    current_user.followers.create(followed_id: @user.id)
  end

  def destroy
    @user = User.find(params[:user_id])
    following_user = current_user.followers.find_by(followed_id: @user.id)
    following_user.destroy
  end

  def followings
    @user = User.find(params[:user_id])
    @followings = @user.following_users
  end

  def followers
    @user = User.find(params[:user_id])
    @followers = @user.follower_users
  end


  private

  def relationship_params
    params.require(:relationship).permit(:user_id)
  end
end
