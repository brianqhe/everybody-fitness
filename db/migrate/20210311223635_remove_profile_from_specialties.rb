class RemoveProfileFromSpecialties < ActiveRecord::Migration[6.1]
  def change
    remove_reference :specialties, :profile, null: false
  end
end
