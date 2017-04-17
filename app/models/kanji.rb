class Kanji < ApplicationRecord
  extend ImportExportCSV
  belongs_to :lesson

  scope :by_lesson, ->id {where lesson_id: id}

  class << self
    # def import_csv file, lesson_id
    #   errors = []
    #   CSV.foreach(file.path, header: true, header_converters: :symbol) do |row|
    #     new_object = self.new row.to_hash
    #     binding.pry
    #     unless new_object.save
    #       errors << I18n.t(:row_erros, row: $.)
    #       errors += new_object.errors.full_messages
    #     end
    #   end
    #   errors
    # end
  end
end
