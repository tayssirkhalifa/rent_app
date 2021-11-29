class Car < ApplicationRecord
    has_one_attached :photo
    has_many :reservations
        validates :Manufacturer,:photo , presence:true
        validates :License_plate , uniqueness: true , presence:true
end
