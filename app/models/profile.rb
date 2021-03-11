class Profile < ApplicationRecord
  belongs_to :user
  has_many :experiences, dependent: :destroy
  has_many :specialties, dependent: :destroy
  has_one_attached :photo

  accepts_nested_attributes_for :specialties

  self.inheritance_column = "not_sti"

  def self.search(search)
      if search 
          where(["first_name ILIKE ?","%#{search}%"])
      else
          all
      end
  end 
end
