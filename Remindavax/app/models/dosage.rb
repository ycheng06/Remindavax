class Dosage < ActiveRecord::Base
  attr_accessible :amount, :unit
  belongs_to :drug
end
