class CreateYoutubes < ActiveRecord::Migration[6.0]
  def change
    create_table :youtubes do |t|
      t.string :link
      t.string :title
      t.text :desc
      t.boolean :done

      t.timestamps
    end
  end
end
