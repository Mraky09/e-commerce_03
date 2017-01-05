class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.datetime :remember_created_at
      t.string :avatar
      t.integer :is_admin
      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
  end
end
