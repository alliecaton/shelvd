class Book < ApplicationRecord
    # belongs_to :author
    has_many :books_shelves 
    has_many :shelves, through: :books_shelves 

end
