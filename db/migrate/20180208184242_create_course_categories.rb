class CreateCourseCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :course_categories do |t|
      t.integer :category_id, null: false
      t.integer :course_id, null: false
      t.timestamps null: false
    end

    add_index :course_categories, :category_id
    add_index :course_categories, :course_id
  end
end
