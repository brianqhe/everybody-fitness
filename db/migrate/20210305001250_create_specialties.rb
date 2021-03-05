class CreateSpecialties < ActiveRecord::Migration[6.1]
  def change
    create_table :specialties do |t|
      t.string :description
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end