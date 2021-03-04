class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :sex, null: false
      t.integer :city, null: false
      t.text :biography, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
