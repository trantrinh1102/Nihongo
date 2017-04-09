class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.references :lesson, foreign_key: true
      t.string :link
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
