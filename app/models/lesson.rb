class Lesson < ApplicationRecord
  attr_accessor :file
  belongs_to :category

  has_many :videos
  has_many :grammars
  has_many :vocabularies
  has_many :kanjis
  has_many :lesson_test

  validates :name, :description, presence: true

  accepts_nested_attributes_for :kanjis, allow_destroy: true
end
