class CreateExperiencesProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :experiences_profiles do |t|
      t.references :experience, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
