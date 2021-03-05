class AddReferenceUserToTodos < ActiveRecord::Migration[6.0]
  def change
    add_reference :todos, :user, foreign_key: true, nill: true
  end
end
