class AddRowToTranslates < ActiveRecord::Migration[6.0]
  def change
    add_column :translates, :Row_num, :integer    
    add_column :translates, :Col_num, :integer
    add_column :translates, :Header, :boolean, default: false
  end
end
