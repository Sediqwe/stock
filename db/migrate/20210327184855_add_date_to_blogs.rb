class AddDateToBlogs < ActiveRecord::Migration[6.0]
  def change
    add_column :blogs, :date, :text, default: false
  end
end
