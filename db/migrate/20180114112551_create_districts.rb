class CreateDistricts < ActiveRecord::Migration[5.0]
  def change
    create_table :districts do |t|
      t.string :name, null: false
      t.string :slug, null: false

      t.timestamps null: false
    end
  end
end
