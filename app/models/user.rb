class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:github]

      has_many :posts
      has_many :reading_rooms, through: :posts
      has_many :shelves
      has_many :books, through: :shelves

   def self.create_from_provider_data(provider_data)
      where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
        user.name = provider_data.info.name
        user.email = provider_data.info.email
        user.password = Devise.friendly_token[0, 20]
    end      
  end

end
