class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.integer :user_id, null: false
      t.integer :question_id, null: false
      t.integer :category_id, null: false
      t.integer :weightage, null: false
      t.timestamps null: false
    end

    add_index :answers, :user_id
    add_index :answers, :question_id
    add_index :answers, :category_id
  end
end
