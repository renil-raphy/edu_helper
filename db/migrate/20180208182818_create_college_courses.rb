class CreateCollegeCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :college_courses do |t|
      t.integer :college_id, null: false
      t.integer :course_id, null: false
      t.string :with_subjects
      t.integer :no_of_seats
      t.timestamps null: false
    end

    add_index :college_courses, :college_id
    add_index :college_courses, :course_id
  end
end
