class CreateRestaurantTable < ActiveRecord::Migration
  def change
    create_table :restaurant do |t|
      t.string "name"
      t.text "description"
      t.text "address"
      t.text ""
      t.string "phone_number"
    end
  end
end
