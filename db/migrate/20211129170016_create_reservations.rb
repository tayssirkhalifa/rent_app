class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :start_date
      t.string :end_date

      t.timestamps
    end
  end
end
