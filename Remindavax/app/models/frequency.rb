class Frequency < ActiveRecord::Base
  attr_accessible :days_per_week, :times_per_day, :weeks_per_month
  belongs_to :drug
  
  validates :days_per_week, :times_per_day, :weeks_per_month, 
    :numericality => true
end
