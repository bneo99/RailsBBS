class AddNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :fname, :string
    add_column :users, :lname, :string
    rename_column :users, :userType, :user_type
  end
end
