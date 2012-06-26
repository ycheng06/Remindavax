class Sponsor < ActiveRecord::Base
  has_many :patients
  attr_accessible :firstname, :lastname, :email, :phone, :password, :passwordconfirmation

  validates :firstname, :lastname, :phone, :presence => true
  validates :email, :presence => true, :uniqueness => true
end
