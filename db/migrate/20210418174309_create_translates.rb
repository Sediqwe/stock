class CreateTranslates < ActiveRecord::Migration[6.0]
  def change
    create_table :translates do |t|
      t.integer :file_id
      t.string :trans_id
      t.text :original
      t.text :translate
      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
