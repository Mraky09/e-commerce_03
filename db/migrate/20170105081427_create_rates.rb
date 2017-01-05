class CreateRates < ActiveRecord::Migration[5.0]
  def change
    create_table :rates do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
