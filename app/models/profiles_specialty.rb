class ProfilesSpecialty < ApplicationRecord
  # Join table that operates on a has-many :through relationship
  # Join table will belong to both the respective tables that it is joining
  belongs_to :profile
  belongs_to :specialty
end
