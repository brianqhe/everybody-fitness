class Specialty < ApplicationRecord
    # Has many through association for specialty model
    has_many :profiles_specialties
    has_many :profiles, through: :profiles_specialties
end
