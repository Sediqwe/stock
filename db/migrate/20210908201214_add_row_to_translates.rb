class AddRowToTranslates < ActiveRecord::Migration[6.0]
  def change
    add_column :translates, :row_num, :integer    
    add_column :translates, :col_num, :integer
    add_column :translates, :header, :boolean, default: false
  end
end
