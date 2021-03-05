class ChangeDoneTodos < ActiveRecord::Migration[6.0]
  def change
    change_column :todos, :done, :boolean, default: false
  end
end
