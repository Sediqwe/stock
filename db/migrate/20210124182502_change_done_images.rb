class ChangeDoneImages < ActiveRecord::Migration[6.0]
  def change
    change_column :images, :done, :boolean, default: false
  end
end
