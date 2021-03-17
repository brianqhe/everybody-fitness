class Search < ApplicationRecord
    self.inheritance_column = "not_sti"

    # Function that will return the search results
    def search_profile
        profile = Profile.all 

        # Returns profiles that have the non case sensitive profile with searched for first name
        profile = profile.where(['first_name ILIKE ?', first_name]) if first_name.present?
        # Returns profiles that have the city searched for
        profile = profile.where(['city ILIKE ?', city]) if city.present?
        # Returns profiles that have the gender that has been searched for
        profile = profile.where(['sex ILIKE ?', sex]) if sex.present?

        return profile
    end 
end
