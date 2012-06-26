class Setting < ActiveRecord::Base
  attr_accessible :is_active, :reminder_preferred_times, :reminder_summary, 
  :send_by_email, :send_by_text
  
  belongs_to :patient
  has_many :preferred_times
end
