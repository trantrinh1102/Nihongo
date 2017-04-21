class Category < ApplicationRecord
  has_many :lessons

  mount_uploader :image, ImageUploader

  validates :name, :description, presence: true
end
