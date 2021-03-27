class CreateTranslates < ActiveRecord::Migration[6.0]
  def change
    create_table :translates do |t|
      t.string :string_add
      t.string :gta_id
      t.string :gta_original
      t.integer :status
      t.string :xml_name
      t.integer :xml_palce
      t.references :user, null: false, foreign_key: true
      t.integer :type

      t.timestamps
    end
  end
end
