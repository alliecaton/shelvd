class Post < ApplicationRecord
    belongs_to :user 
    belongs_to :reading_room

    validates :content, presence: :true

end
