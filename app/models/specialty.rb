class Specialty < ApplicationRecord
  has_many :profiles_specialties
  has_many :profiles, through: :profiles_specialties
end
