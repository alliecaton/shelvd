class Book < ApplicationRecord
    belongs_to :author, class_name: "User"
    has_many :books_shelves 
    has_many :shelves, through: :books_shelves 

end
