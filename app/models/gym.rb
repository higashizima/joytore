class Gym < ApplicationRecord
  has_many :users
  has_many :favorite_gyms, dependent: :destroy
  has_meny :favorited_users, throug: :favorite_gyms, source: :user
end
