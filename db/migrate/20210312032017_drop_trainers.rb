class DropTrainers < ActiveRecord::Migration[6.1]
  def change
    drop_table :trainers
  end
end
