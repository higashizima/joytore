class TrainingRecord < ApplicationRecord
  has_many :details, inverse_of: :training_record, dependent: :destroy
  accepts_nested_attributes_for :details, reject_if: :all_blank, allow_destroy: true
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  
  validates :content, length: {maximum: 150}
end
