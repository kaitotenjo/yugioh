class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]
  has_one_attached :avatar 
  has_one :cart 
  has_many :orders
  has_many :commets
  enum role: [:user,:manager ,:admin] 
  after_initialize :set_default_role ,:if =>  :new_record?

  def set_default_role
    self.role ||= :user
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
    end
  end
end
