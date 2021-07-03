class AddReferenceProjectToUploads < ActiveRecord::Migration[6.0]
  def change
    add_reference :uploads, :project, foreign_key: true, nill: true
  end
end
