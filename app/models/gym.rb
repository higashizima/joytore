class Gym < ApplicationRecord
  has_many :users
  # タイムラインでジムの投稿一覧を表示させるため
  has_many :training_records, through: :users
  has_many :favorite_gyms, dependent: :destroy
  has_many :favorited_users, through: :favorite_gyms, source: :user
  
  with_options presence: true do
    validates :gym_name
    validates :postcode
    validates :address
    validates :fee
    validates :is_open
  end
  
  def favorited_by?(user)
    favorite_gyms.exists?(user_id: user.id)
  end
  
    # ransackに検索を許可するリストを設定
  def self.ransackable_attributes(auth_object = nil)
      ["gym_name"]
  end
end
