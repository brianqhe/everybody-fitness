class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # Devise settings for how a user will interact when trying to log in/sign up or recover their passwords
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # One to one relationship, where a user can only have 1 profile
  has_one :profiles
end
