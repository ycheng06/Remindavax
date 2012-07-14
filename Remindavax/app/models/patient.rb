class Patient < ActiveRecord::Base
  has_many :drugs
  has_one :setting
  has_many :preferred_times, :through => :setting
  belongs_to :doctor 
  belongs_to :sponsor
  
  attr_accessible :email, :password, :password_confirmation, :firstname, :lastname, :phone
  attr_accessor :password
  before_save :encrypt_password
  
  validates :firstname, :lastname, :phone, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true, :confirmation => true, 
  			:on => :create
  			
  def self.authenticate(email, password)
  	patient = find_by_email(email)
  	if patient && patient.password_hash == BCrypt::Engine.hash_secret(password, patient.password_salt)
  		patient
  	else
  		nil 
  	end
  end
  
  def encrypt_password
  	if password.present?
  		self.password_salt = BCrypt::Engine.generate_salt
  		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  	end
  end
  
end
