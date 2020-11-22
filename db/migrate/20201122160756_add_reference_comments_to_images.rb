class AddReferenceCommentsToImages < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :images, foreign_key: true, nill: true
  end
end
