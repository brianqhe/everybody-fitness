class Experience < ApplicationRecord
  # An experience belongs to a profile,
    belongs_to :profile

    # Sanitation functions to make sure data is sanitised before saved
    before_save :remove_whitespace
    before_save :capitalize

    private

    # Strips the whitespaces from the description entered
    def remove_whitespace
      self.description = self.description.strip
    end
  
    # Capitalizes the description
    def capitalize
      self.description = self.description.capitalize
    end
end
