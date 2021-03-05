class AddSpecialtyToProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :specialty, :string
  end
end
