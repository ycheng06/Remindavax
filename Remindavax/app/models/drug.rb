class Drug < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :patient
  has_one :dosage
  has_one :frequency
end
