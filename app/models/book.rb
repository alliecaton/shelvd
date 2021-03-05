class Book < ApplicationRecord
    has_many :books_shelves 
    has_many :shelves, through: :books_shelves 
    has_many :users, through: :shelves



    # def self.order_by_date
    # end 

    def self.search(search)
        GoogleBooks.search("#{search}", {count: 3 })
    end 

    def self.sort_by_rating(books)
        books.order :average_rating
    end

end
