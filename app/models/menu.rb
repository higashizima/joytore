class Menu < ApplicationRecord
  has_many :details
  accepts_nested_attributes_for :details, allow_destroy: true
end
