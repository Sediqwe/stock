class AddMultiToImages < ActiveRecord::Migration[6.0]
  def change
    add_column :images, :multi, :boolean, default: false
  end
end
