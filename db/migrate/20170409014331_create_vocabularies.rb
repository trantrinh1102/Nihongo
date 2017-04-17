class CreateVocabularies < ActiveRecord::Migration[5.0]
  def change
    create_table :vocabularies do |t|
      t.references :lesson, foreign_key: true
      t.string :japanese
      t.string :vietnamese
      t.string :romaji
      t.string :audio_link
      t.string :image_link
      t.text :description

      t.timestamps
    end
  end
end
