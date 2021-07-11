class AddReferenceUsersToTranslates < ActiveRecord::Migration[6.0]
  def change
    add_reference :translates, :users, foreign_key: true, nill: true
    
  end
end
