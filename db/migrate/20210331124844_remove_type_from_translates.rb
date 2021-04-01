class RemoveTypeFromTranslates < ActiveRecord::Migration[6.0]
  def change
    remove_column :translates, :type, :string
  end
end
