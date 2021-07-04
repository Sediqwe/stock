class AddFileToTranslates < ActiveRecord::Migration[6.0]
  def change
    add_column :translates, :file, :text
    add_column :translates, :status, :integer
  end
end
