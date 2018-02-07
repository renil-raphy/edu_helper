class CreateUserCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :user_categories do |t|
      t.integer :user_id, null: false
      t.integer :category_id, null: false
      t.integer :total_weightage, null: false
      t.timestamps null: false
    end

    add_index :user_categories, :user_id
    add_index :user_categories, :category_id
  end
end
