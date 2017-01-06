class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.integer :depth
      t.integer :left
      t.integer :right

      t.timestamps
    end
  end
end
