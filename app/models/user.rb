class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:github]

      #has_many :posts
      #has_many :readingrooms, through: :posts
      has_many :shelves
      has_many :books, through: :shelves

   def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end      
  end

end

#class Post

  # belongs_to :user 
  # belongs_to :readingroom

# end


# class ReadingRoom 

#   has_many :posts
#   has_many :users, through: :posts 

# end