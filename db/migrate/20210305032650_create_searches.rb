class CreateSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :searches do |t|
      t.string :first_name
      t.string :city
      t.string :sex

      t.timestamps
    end
  end
end
