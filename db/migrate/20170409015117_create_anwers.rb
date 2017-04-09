class CreateAnwers < ActiveRecord::Migration[5.0]
  def change
    create_table :anwers do |t|
      t.references :question, foreign_key: true
      t.text :content
      t.boolean :is_correct

      t.timestamps
    end
  end
end
