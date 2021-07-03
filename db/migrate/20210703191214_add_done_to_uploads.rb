class AddDoneToUploads < ActiveRecord::Migration[6.0]
  def change
    add_column :uploads, :done, :boolean, default: false
  end
end
