class AddCarToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :car_id, :integer
  end
end
