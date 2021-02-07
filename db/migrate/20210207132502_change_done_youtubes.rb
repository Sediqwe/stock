class ChangeDoneYoutubes < ActiveRecord::Migration[6.0]
  def change
    change_column :youtubes, :done, :boolean, default: false
  end
end
