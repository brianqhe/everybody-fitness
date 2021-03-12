class Profile < ApplicationRecord
  belongs_to :user
  has_many :experiences, dependent: :destroy
  has_many :profiles_specialties
  has_many :specialties, dependent: :destroy, through: :profiles_specialties
  has_one_attached :photo

  before_save :remove_whitespace
  before_save :capitalize

  self.inheritance_column = "not_sti"

  def self.search(search)
      if search 
          where(["first_name ILIKE ?","%#{search}%"])
      else
          all
      end
  end 

  private

  def remove_whitespace
    self.first_name = self.first_name.strip
    self.last_name = self.last_name.strip
    self.biography = self.biography.strip
  end

  def capitalize
    self.first_name = self.first_name.capitalize
    self.last_name = self.last_name.capitalize
    self.biography = self.biography.capitalize
  end

end
