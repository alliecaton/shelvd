class Book < ApplicationRecord
    has_many :books_shelves 
    has_many :shelves, through: :books_shelves 
    has_many :users, through: :shelves
    has_many :books_authors
    has_many :authors, through: :books_authors

    validates :title, presence: true 
    validates :isbn, presence: :true 
    # validate :author_id, presence: true



    # def self.order_by_date
    # end 


    def self.search(search)
        book = GoogleBooks.search("#{search}", {count: 3 })
    end 

    def self.sort_by_rating(books)
        books.order :average_rating
    end

    def select_current_user_shelves
        
    end

end
