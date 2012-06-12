class Doctor < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :patients
end
