class TrainingRecord < ApplicationRecord
  # 詳細のアソシエーション、ネスト
  has_many :details, inverse_of: :training_record, dependent: :destroy
  accepts_nested_attributes_for :details, reject_if: :all_blank, allow_destroy: true

  belongs_to :user
  # タイムラインでジムの投稿一覧を表示させるため
  has_one :master,  through: :user
  has_many :post_comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user


  validates :content, length: {maximum: 150}
  validates :details, presence: true

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

  # ransackに検索を許可するリストを設定
def self.ransackable_attributes(auth_object = nil)
    ["content", "user_id"]
end

end
