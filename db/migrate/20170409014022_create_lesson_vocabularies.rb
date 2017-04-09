class CreateLessonVocabularies < ActiveRecord::Migration[5.0]
  def change
    create_table :lesson_vocabularies do |t|
      t.references :lesson, foreign_key: true
      t.references :vocabulary, foreign_key: true

      t.timestamps
    end
  end
end
