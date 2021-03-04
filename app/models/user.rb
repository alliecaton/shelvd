class User < ApplicationRecord
    has_many :shelves
    
    # has_secure_password
end
