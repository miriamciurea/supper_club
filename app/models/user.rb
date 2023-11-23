class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :events, dependent: :destroy
  has_many :tickets
  has_one_attached :photo

  def self.from_google(user = {})
    create_with(uid: user[:uid], provider: 'google_oauth2',
                password: Devise.friendly_token[0, 20]).find_or_create_by!(email: user[:email])
  end
  # def self.from_google(attr = {})
  #   find_or_create_by(email: attr[:email], uid: attr[:uid], provider: 'google_oauth2')
  # end
end
