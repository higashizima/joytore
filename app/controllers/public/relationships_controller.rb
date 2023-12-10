class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    user = User.find(params[:user_id])
    current_user.followers.create(followed_id: user.id)
    redirect_to request.referer
  end
  
  def destroy
    user = User.find(params[:user_id])
    following_user = current_user.followers.find_by(followed_id: user.id)
    following_user.destroy
    redirect_to request.referer
  end
  
  def followings
    @followings = current_user.following_users
  end
  
  def followers
    @followers = current_user.follower_users
  end
end
