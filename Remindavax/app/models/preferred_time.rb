class PreferredTime < ActiveRecord::Base
  attr_accessible :time_to_receive_reminder
  belongs_to :setting
end
