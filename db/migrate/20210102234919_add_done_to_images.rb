class AddDoneToImages < ActiveRecord::Migration[6.0]
  def change
    add_column :images, :done, :boolean
  end
end
