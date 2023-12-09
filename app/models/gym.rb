class Gym < ApplicationRecord
  has_many :users
  has_many :favorite_gyms, dependent: :destroy
  has_many :favorited_users, through: :favorite_gyms, source: :user
  
  def favorited_by?(user)
    favorite_gyms.exists?(user_id: user.id)
  end
end
