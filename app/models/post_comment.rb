class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :training_record
  
  validates :comment, presence: true, length: {maximum: 25}
end
