class Shelf < ApplicationRecord
    belongs_to :user
    has_many :books_shelves
    has_many :books, through: :books_shelves

    validates :name, presence: :true


#     def self.current_user_shelves(user)
#         self.where(user_id: user.id)
#     end

#     def self.find_book_in_shelf(book)
#         self.where("shelf_id = ?, book_id = ?", "array[0]", "array[1]")
#     end

    # def is_logged_in_and_owner?
    #     byebug
    #     unless user_signed_in? && self.user == current_user
    #         redirect_to user_path(current_user)
    #     end
    # end
end
