class AddPasswordDigestToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string, nill: true, unique: true
  end
end
