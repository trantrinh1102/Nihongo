class CreateGrammars < ActiveRecord::Migration[5.0]
  def change
    create_table :grammars do |t|
      t.references :lesson, foreign_key: true
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
