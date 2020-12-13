class AddNamePhoneWorkgroupToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string, null: false, default: ""
    add_reference :users, :state, index: true
    add_foreign_key :users, :states

    add_index :users, :name, unique: true
  end
end
