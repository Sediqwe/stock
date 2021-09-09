class FixColumnName2 < ActiveRecord::Migration[6.0]
  def change
    rename_column :projects, :descripion, :description
  end
end
