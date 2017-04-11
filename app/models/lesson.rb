class Lesson < ApplicationRecord
  belongs_to :category

  has_many :videos
  has_many :grammars
  has_many :lesson_vocabularies
  has_many :kanjis
  has_many :lesson_test

  validates :name, :description, presence: true
end
