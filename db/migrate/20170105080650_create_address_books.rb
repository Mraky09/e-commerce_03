class CreateAddressBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :address_books do |t|
      t.string :fullname
      t.string :telephone
      t.string :address
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
