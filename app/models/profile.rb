class Profile < ApplicationRecord
  belongs_to :user
  has_many :experiences
  has_many :specialties
  has_one_attached :photo

  self.inheritance_column = "not_sti"

  def self.search(search)
      if search 
          where(["first_name ILIKE ?","%#{search}%"])
      else
          all
      end
  end 
end
