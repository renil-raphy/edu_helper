class AddMetaToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :description, :text
    add_column :categories, :carriers, :text, array: true, default: []
  end
end
