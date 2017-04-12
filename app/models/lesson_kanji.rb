class LessonKanji < ApplicationRecord
  belongs_to :lesson
  has_many :kanjis
end
