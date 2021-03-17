class Profile < ApplicationRecord
  # One to one relationship, where a user can only have 1 profile and a profile can only have 1 user
  belongs_to :user
  # One to many relationship, where a profile can have many experiences. Dependent destroy to ensure the relevant experiences are destroyed when a user destroys their profile
  has_many :experiences, dependent: :destroy
  # Has-many :through relationship, where a profile has many specialties through the join table
  has_many :profiles_specialties
  # Has-many :through relationship, where a profile has many specialties through the join table
  has_many :specialties, dependent: :destroy, through: :profiles_specialties
  # Method to allow a photo to be attached to a profile
  has_one_attached :photo

  # Call on the relevant data sanitsation functions before saving a profile
  before_save :remove_whitespace
  before_save :capitalize

  self.inheritance_column = "not_sti"

  # Basic search function that will return a non-case sensitive search result in the search bar
  def self.search(search)
      if search 
          where(["first_name ILIKE ?","%#{search}%"])
      else
          all
      end
  end 

  private

  # Removes whitespaces in the front and end of the input from first and last name and also the biography
  def remove_whitespace
    self.first_name = self.first_name.strip
    self.last_name = self.last_name.strip
    self.biography = self.biography.strip
  end

  # Capitalises the first letter of the first and last name and also the biography
  def capitalize
    self.first_name = self.first_name.capitalize
    self.last_name = self.last_name.capitalize
    self.biography = self.biography.capitalize
  end

end
