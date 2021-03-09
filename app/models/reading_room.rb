class ReadingRoom < ApplicationRecord
    has_many :posts
    has_many :users, through: :posts 

    validates :name, presence: :true
end
