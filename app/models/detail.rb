class Detail < ApplicationRecord
  validates :weight, presence: true
  validates :rep, presence: true
  validates :set, presence: true
  
  belongs_to :menu
  belongs_to :training_record
end
