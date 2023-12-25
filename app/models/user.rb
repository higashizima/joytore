class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "Guest"
      user.gym_id = "1"
      user.is_active = true
    end
  end       
  
  # ログイン時の会員ステータス確認
  def active_for_authentication?
    super && (self.is_active == true)
  end
  
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

  validates :description, length: {maximum: 160}
  validates :name,presence: true

  has_one_attached :profile_image
  # プロフィール画像取得
  def get_profile_image(width, height)
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/test_cow.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'test_cow.jpg', content_type: 'image/j')
  end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  # フォロー確認
  def following?(user)
    following_users.include?(user)
  end

  # ransackに検索を許可するリストを設定
  def self.ransackable_attributes(auth_object = nil)
      ["name"]
  end

end
