class Drug < ActiveRecord::Base  
  belongs_to :patient
  has_one :dosage
  has_one :frequency
  accepts_nested_attributes_for :dosage, :frequency
	attr_accessible :name, :treatmentname, :days_worth_of_medication,
		:refill_date, :dosage_attributes
	
	validates :name, :treatmentname, :refill_date, :presence => true
	validates :days_worth_of_medication, :numericality => {:only_integer => true}
	validate :refill_date_cannot_be_in_the_past
	
	def refill_date_cannot_be_in_the_past
		if !refill_date.blank? and refill_date < Date.today
			errors.add(:refill_date, "can't be in the past")
		end
	end
 
end
