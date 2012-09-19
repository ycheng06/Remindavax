class Drug < ActiveRecord::Base  
  belongs_to :patient
  has_one :dosage
  has_one :frequency
  accepts_nested_attributes_for :dosage, :frequency
	attr_accessible :name, :treatmentname, :days_worth_of_medication,
		:refill_date, :dosage_attributes, :frequency_attributes
  after_initialize :default_values 
	
	validates :name, :treatmentname, :refill_date, :presence => true
	validates :days_worth_of_medication, :numericality => {:only_integer => true}
	validate :refill_date_cannot_be_in_the_past

  DRUGS = ['advair 100/50', 'advair 250/50', 'advair 500/50', 'advair diskus',
            'advair hfa 45/21', 'flovent 110', 'flovent 22']
	
  private
  def refill_date_cannot_be_in_the_past
		if !refill_date.blank? and refill_date < Date.today
			errors.add(:refill_date, "can't be in the past")
		end
	end

  def default_values
    if self.new_record?
      self.days_worth_of_medication = 1
    end
  end
 
end
