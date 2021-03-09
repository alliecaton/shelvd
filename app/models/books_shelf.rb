class BooksShelf < ApplicationRecord
    belongs_to :book
    belongs_to :shelf

    def self.select_association(array)
        self.where("shelf_id = ?, book_id = ?", "array[0]", "array[1]")
    end

end