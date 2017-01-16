class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.string :shipping_address
      t.integer :status
      t.float :total_money

      t.timestamps
    end
  end
end
