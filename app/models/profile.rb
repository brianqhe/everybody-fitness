class Profile < ApplicationRecord
  belongs_to :user
  has_many :experiences
  has_many :specialties
  has_one_attached :photo
end
