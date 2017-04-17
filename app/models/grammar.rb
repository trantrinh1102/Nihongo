class Grammar < ApplicationRecord
  belongs_to :lesson

  validates :title, :content, presence: true

  scope :by_lesson, ->(lesson_id) {where lesson_id: lesson_id}
end
