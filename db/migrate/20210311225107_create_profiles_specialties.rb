class CreateProfilesSpecialties < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles_specialties do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :specialty, null: false, foreign_key: true

      t.timestamps
    end
  end
end
