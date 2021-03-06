class AddBooksColumns < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :image_link, :string 
    add_column :books, :isbn, :integer 
    add_column :books, :category_id, :integer
  end
end
