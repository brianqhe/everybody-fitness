class Experience < ApplicationRecord
    has_many :experiences_profiles
    has_many :profiles, through: :experiences_profiles
end
