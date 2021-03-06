class Shelf < ApplicationRecord
    belongs_to :user
    has_many :books_shelves
    has_many :books, through: :books_shelves

    validates :name, presence: :true
end
