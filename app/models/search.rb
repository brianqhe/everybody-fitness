class Search < ApplicationRecord
    self.inheritance_column = "not_sti"

    def search_profile
        profile = Profile.all 

        profile = profile.where(['first_name ILIKE ?', first_name]) if first_name.present?
        profile = profile.where(['city ILIKE ?', city]) if city.present?
        profile = profile.where(['sex ILIKE ?', sex]) if sex.present?

        return profile
    end 
end
