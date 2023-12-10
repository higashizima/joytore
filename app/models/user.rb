class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # フォロー機能
  has_many :followers, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followeds, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_users, through: :followers, source: :followed
  has_many :follower_users, through: :followeds, source: :follower
  # 登録ジムとお気に入りジム
  belongs_to :gym
  has_many :favorite_gyms, dependent: :destroy
  has_many :favorited_gyms, through: :favorite_gyms, source: :gym
  # トレーニング記録
  has_many :training_records, dependent: :destroy
  accepts_nested_attributes_for :training_records, allow_destroy: true
  # コメント
  has_many :post_comments, dependent: :destroy
  # いいね
  has_many :likes, dependent: :destroy
  has_many :liked_training_records, through: :likes, source: :training_record
  
  
  has_one_attached :profile_image
  # プロフィール画像取得
  def get_profile_image(width, height)
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/NoImage.png')  
    profile_image.attach(io: File.open(file_path), filename: 'NoImage.png', content_type: 'image/png')
  end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
  # フォロー確認
  def following?(user)
    following_users.include?(user)
  end	

end
