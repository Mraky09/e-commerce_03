class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :addressbook, foreign_key: true
      t.integer :status
      t.float :total_money

      t.timestamps
    end
  end
end
