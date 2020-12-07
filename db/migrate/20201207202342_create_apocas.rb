class CreateApocas < ActiveRecord::Migration[6.0]
  def change
    create_table :apocas do |t|
      t.string :user
      t.integer :darab

      t.timestamps
    end
  end
end
