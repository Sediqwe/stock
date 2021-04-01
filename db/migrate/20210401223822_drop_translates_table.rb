class DropTranslatesTable < ActiveRecord::Migration[6.0]
  def change
    
      drop_table :translates
    
  end
end
