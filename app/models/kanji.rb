class Kanji < ApplicationRecord
  extend ImportExportCSV
  belongs_to :lesson

  scope :by_lesson, ->id {where lesson_id: id}

end
