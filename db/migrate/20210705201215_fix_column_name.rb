class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :translates, :type, :trans_type
  end
end
