class AddUsernameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string    
  end
    add_index :username, unique: true
end
