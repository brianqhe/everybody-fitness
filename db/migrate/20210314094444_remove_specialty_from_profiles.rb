class RemoveSpecialtyFromProfiles < ActiveRecord::Migration[6.1]
  def change
    remove_column :profiles, :specialty, :string
  end
end
