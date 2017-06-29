class AddPublishedToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :published, :boolean, default: false
  end
end
