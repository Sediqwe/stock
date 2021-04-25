class AddReferenceUploadToTranslates < ActiveRecord::Migration[6.0]
  def change
    add_reference :translates, :uploads, foreign_key: true, nill: true
  end
end
