class Vocabulary < ApplicationRecord
  extend ImportExportCSV

  belongs_to :lesson

  mount_uploader :image, ImageUploader
  mount_uploader :audio, SoundUploader

  scope :by_lesson, ->lesson_id {where lesson_id: lesson_id}
end
