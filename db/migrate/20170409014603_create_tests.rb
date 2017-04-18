class CreateTests < ActiveRecord::Migration[5.0]
  def change
    create_table :tests do |t|
      t.references :lesson, foreign_key: true

      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
