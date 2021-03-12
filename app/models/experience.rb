class Experience < ApplicationRecord
    belongs_to :profile

    before_save :remove_whitespace
    before_save :capitalize

    private

    def remove_whitespace
      self.description = self.description.strip
    end
  
    def capitalize
      self.description = self.description.capitalize
    end
end
