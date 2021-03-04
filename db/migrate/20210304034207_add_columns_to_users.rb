class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :last_name, :string, null: false
    add_column :users, :sex, :integer, null: false
    add_column :users, :city, :integer, null: false
  end
end
