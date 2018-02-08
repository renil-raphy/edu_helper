class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.text :description
      t.string :duration
      t.timestamps null: false
    end
  end
end
