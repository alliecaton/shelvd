class BooksShelf < ApplicationRecord
    belongs_to :book
    belongs_to :shelf
end