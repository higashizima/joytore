class TrainingRecord < ApplicationRecord
  has_many :details, dependent: :destroy
  accepts_nested_attributes_for :details, allow_destroy: true
  belongs_to :user
end
