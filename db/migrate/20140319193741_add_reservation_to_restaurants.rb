class AddReservationToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :reservation_id, :integer
  end
end
