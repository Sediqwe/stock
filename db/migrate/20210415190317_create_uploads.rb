class CreateUploads < ActiveRecord::Migration[6.0]
  def change
    create_table :uploads do |t|
      t.string :name
      t.string :description
      t.string :version
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
