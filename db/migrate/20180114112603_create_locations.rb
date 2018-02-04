class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.integer :district_id, null: false

      t.timestamps null: false
    end

    add_index :locations, :district_id
  end
end
