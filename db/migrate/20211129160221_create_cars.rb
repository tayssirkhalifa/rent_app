class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :Manufacturer
      t.string :License_plate
      t.string :photo

      t.timestamps
    end
  end
end
