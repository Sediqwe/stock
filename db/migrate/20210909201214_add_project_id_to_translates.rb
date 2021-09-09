class AddProjectIdToTranslates < ActiveRecord::Migration[6.0]
  def change
    add_column :translates, :project_id, :integer    
  end
end
