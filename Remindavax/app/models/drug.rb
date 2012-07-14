class Drug < ActiveRecord::Base  
  belongs_to :patient
  has_one :dosage
  has_one :frequency
	
	attr_accessible :name, :treatmentname, :days_worth_of_medication,
		:refill_date
	
	
 
end
