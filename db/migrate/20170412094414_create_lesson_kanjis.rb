class CreateLessonKanjis < ActiveRecord::Migration[5.0]
  def change
    create_table :lesson_kanjis do |t|
      t.string :title
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
