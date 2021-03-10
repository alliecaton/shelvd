class ReadingRoom < ApplicationRecord
    has_many :posts
    has_many :users, through: :posts 

    validates :name, presence: :true



    def self.search(search)
        self.where("name LIKE ?", "%#{search}%")
    end 

end


