class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  belongs_to :gym
  has_many :favorite_gyms, dependent: :destroy
  has_many :favorited_gyms, through: :favorite_gyms, source: :gym
  has_many :training_records, dependent: :destroy
  accepts_nested_attributes_for :training_records, allow_destroy: true
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_training_records, through: :likes, source: :training_record
  
  has_one_attached :profile_image
  
  def get_profile_image(width, height)
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/NoImage.png')
    profile_image.attach(io: File.open(file_path), filename: 'NoImage.png', content_type: 'image/png')
  end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
end
