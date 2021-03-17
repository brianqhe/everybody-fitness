class Specialty < ApplicationRecord
    # Has many through association for specialty model, a specialty can have many entries in the join table, and can also have many profiles through the join table
    has_many :profiles_specialties
    has_many :profiles, through: :profiles_specialties
end
