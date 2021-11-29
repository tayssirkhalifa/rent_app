class Reservation < ApplicationRecord
    belongs_to :car
	belongs_to :user


    	#validates :user, uniqueness: {scope: :start_date, message: "is booked already"}
        validates :car, uniqueness: {scope: :start_date, message: "is booked already"}
        validate  :no_past_booking
            validate :no_booking_greater_than_one_day

        
     
            def no_past_booking
            if Date.today > start_date
                errors.add(:start_date, "cannot be in the past")
            end
        end	
    
        
    def no_booking_greater_than_one_day
		if end_date > (start_date+1.days)
			errors.add(:end_date, "booking period cannot be greater than one day ")
		end
	end	
    
        
    
end

