class Test < ApplicationRecord
  belongs_to :lesson

  has_many :results
  has_many :questions

  scope :by_lesson, ->lesson_id {where lesson_id: lesson_id}
end
