class CreateKanjis < ActiveRecord::Migration[5.0]
  def change
    create_table :kanjis do |t|
      t.references :lesson, foreign_key: true

      t.string :character
      t.string :vietnamese
      t.string :romaji
      t.string :example

      t.timestamps
    end
  end
end
