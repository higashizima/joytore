class Like < ApplicationRecord
  belongs_to :user
  belongs_to :training_record
  
  validates :user_id, uniqueness: {scope: :training_record_id}
end
