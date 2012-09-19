class Frequency < ActiveRecord::Base
  attr_accessible :days_per_week, :times_per_day, :weeks_per_month
  belongs_to :drug
  after_initialize :default_values

  validates :days_per_week, :times_per_day, :weeks_per_month, 
    :numericality => true

  private
  def default_values
    if self.new_record?
      self.days_per_week = 1
      self.times_per_day = 1
      self.weeks_per_month = 1
    end
  end
  
end
