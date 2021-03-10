class Book < ApplicationRecord
    has_many :books_shelves 
    has_many :shelves, through: :books_shelves 
    has_many :users, through: :shelves
    has_many :books_authors
    has_many :authors, through: :books_authors

    scope :highest_rated, -> {where('average_rating >= ?', 4).sort}

    validates :title, presence: true 
    validates :isbn, presence: :true 


    def most_pop
        average_rating.to_i * ratings_count.to_i
    end

    def self.highest_rated_sorted
        highest_rated.sort_by {|book| book.most_pop }
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
