class AddModelTable < ActiveRecord::Migration[6.1]
  def change
    create_table :experiences do |t|
      t.string "description"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
  end
end
