class RemoveStringAddFromTranslates < ActiveRecord::Migration[6.0]
  def change
    remove_column :translates, :string_add, :string
  end
end
