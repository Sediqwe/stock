class AddTypeToTranslates < ActiveRecord::Migration[6.0]
  def change
    add_column :translates, :type, :boolean, default: false    
  end
end
