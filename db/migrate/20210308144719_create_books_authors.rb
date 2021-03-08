class CreateBooksAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :books_authors do |t|
      t.integer :author_id
      t.integer :book_id

      t.timestamps
    end
  end
end
