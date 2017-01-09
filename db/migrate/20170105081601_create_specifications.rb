class CreateSpecifications < ActiveRecord::Migration[5.0]
  def change
    create_table :specifications do |t|
      t.references :product, foreign_key: true
      t.string :feature_name
      t.string :feature_value

      t.timestamps
    end
    add_index :specifications, [:id, :product_id], unique: true
  end
end
