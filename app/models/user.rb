class User < ApplicationRecord
    has_many :shelves
    has_many :books, foreign_key: :author_id
    
    # has_secure_password
end
