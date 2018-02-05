class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :qn_text, null: false
      t.integer :category_id, null: false
      t.timestamps null: false
    end

    add_index :questions, :category_id
  end
end
