class Shelf < ApplicationRecord
    belongs_to :user
    has_many :books_shelves
    has_many :books, through: :books_shelves

    validates :name, presence: :true


    def self.current_user_shelves(user)
        self.where(user_id: user.id)
    end

    def self.find_book_in_shelf(shelf, book)
        self.where("shelf_id = ?, book_id = ?", "array[0]", "array[1]")
    end
end
