class AddCotegoryIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :category_id, :integer
    add_index :posts, :category_id
  end
end
