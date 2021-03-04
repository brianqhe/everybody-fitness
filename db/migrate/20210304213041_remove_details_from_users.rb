class RemoveDetailsFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
    remove_column :users, :sex, :integer
    remove_column :users, :city, :integer
  end
end
