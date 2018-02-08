class CreateColleges < ActiveRecord::Migration[5.0]
  def change
    create_table :colleges do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.text :address
      t.string :phone
      t.string :website
      t.integer :university_id, null: false
      t.integer :location_id, null: false
      t.timestamps null: false
    end

    add_index :colleges, :university_id
    add_index :colleges, :location_id
  end
end
