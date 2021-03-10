class ReadingRoom < ApplicationRecord
    has_many :posts
    has_many :users, through: :posts 

    validates :name, presence: :true
    validates :description, presence: :true
    validates :name, uniqueness: true 



    def self.search(search)
        self.where("name LIKE ?", "%#{search}%")
    end 

end


