class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :name
      t.text :description
      t.integer :prior
      t.boolean :done

      t.timestamps
    end
  end
end
