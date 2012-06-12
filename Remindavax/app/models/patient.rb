class Patient < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :drugs
  belongs_to :doctor 
  belongs_to :sponsor
end
