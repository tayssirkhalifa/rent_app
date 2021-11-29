class User < ApplicationRecord
    has_many :reservations
    validates :first_name ,:last_name , presence:true,
    


	length: {maximum:25,minimum:3},uniqueness: true ,
	format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
  	validate :birthday_cant_be_in_the_future
    
  #date of birth can't be in future
  def birthday_cant_be_in_the_future
    if date_of_birth > Date.today
      errors.add(:date_of_birth, "invalid date of birth")
    end
  end
validate :validade_birth_date

def validade_birth_date
    if date_of_birth > 18.years.ago
    errors.add(:date_of_birth, "must be at least 18 years old")
  end
end
end
