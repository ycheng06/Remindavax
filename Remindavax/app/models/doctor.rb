class Doctor < ActiveRecord::Base
  attr_accessible :name, :phone, :email
  has_many :patients
end
