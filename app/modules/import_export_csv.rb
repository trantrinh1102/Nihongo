module ImportExportCSV
  def to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |item|
        csv << item.attributes.values_at(*column_names)
      end
    end
  end
  def import_csv lesson_id, file
    errors = []
    CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
      new_object = self.new row.to_hash
      new_object[:lesson_id] = lesson_id
      unless new_object.save
        errors << I18n.t(:row_erros, row: $.)
        errors += new_object.errors.full_messages
      end
    end
    errors
  end
end
