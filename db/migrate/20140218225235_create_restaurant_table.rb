class CreateRestaurantTable < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string "name"
      t.text "description"
      t.text "address"
      t.string "phone_number"
    end
  end
end
