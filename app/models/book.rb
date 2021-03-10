class Book < ApplicationRecord
    has_many :books_shelves 
    has_many :shelves, through: :books_shelves 
    has_many :users, through: :shelves
    has_many :books_authors
    has_many :authors, through: :books_authors

    validates :title, presence: true 
    validates :isbn, presence: :true 


    def self.highest_rated
        self.where('average_rating >= ?', 4)
    end
    
    def self.search(search)
        book = GoogleBooks.search("#{search}", {count: 3 })
    end 

    # def self.order_by_date
    # end 

    # def self.sort_by_rating(books)
    #     books.order :average_rating
    # end

end
