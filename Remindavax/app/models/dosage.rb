class Dosage < ActiveRecord::Base
  attr_accessible :amount, :unit
  belongs_to :drug

  validates :amount, :unit, :presence => true
  validates :amount, :numericality => true
  

end
