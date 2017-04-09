class LessonTest < ApplicationRecord
  belongs_to :lesson

  has_many :tests
end
