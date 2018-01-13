class CreateUniversities < ActiveRecord::Migration[5.0]
  def change
    create_table :universities do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.string :website
      t.string :phone
      t.text :address, null: false

      t.timestamps null: false
    end
  end
end
