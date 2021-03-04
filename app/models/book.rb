class Book < ApplicationRecord
    belongs_to :author, class_name: "User"
    has_many :books_shelves 
    has_many :shelves, through: :books_shelves 


    # def self.order_by_date
    # end 

    def self.search(search)
        GoogleBooks.search("#{search}", {count: 1 }).first
    end 

    def self.sort_by_rating(books)
        books.order :average_rating
    end

end
