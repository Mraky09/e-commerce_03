class CreateSpecifications < ActiveRecord::Migration[5.0]
  def change
    create_table :specifications do |t|
      t.references :product, foreign_key: true
      t.string :attribute
      t.string :value

      t.timestamps
    end
  end
end
