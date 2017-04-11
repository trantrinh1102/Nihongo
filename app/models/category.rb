class Category < ApplicationRecord
  has_many :lessons

  validates :name, :description, presence: true
end
