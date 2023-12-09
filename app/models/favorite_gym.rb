class FavoriteGym < ApplicationRecord
  belongs_to :user
  belongs_to :gy

  validates :user_id, uniqueness: {scope: :gym_id}
end
