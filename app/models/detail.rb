class Detail < ApplicationRecord
  
  with_options numericality: { greater_than_or_equal_to: 1 }, presence: true do
    validates :weight
    validates :rep
    validates :set
  end
  
  
  belongs_to :menu
  belongs_to :training_record
end
