class CreateLessonTests < ActiveRecord::Migration[5.0]
  def change
    create_table :lesson_tests do |t|
      t.references :test, foreign_key: true
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
