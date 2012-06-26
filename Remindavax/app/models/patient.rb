class Patient < ActiveRecord::Base
  has_many :drugs
  has_one :setting
  belongs_to :doctor 
  belongs_to :sponsor
  attr_accessible :firstname , :lastname, :phone, :relation_to_sponsor, 
  					:email, :password, :passwordconfirmation
  
  validates :firstname, :lastname, :phone, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true, :confirmation => true, 
  			:on => :create
  			
  def authenticate(email, password)
  	user = find_by_email(email)
  	if user && user.password_hash == BCrypt::Engine.hash_secret(password, password_salt)
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
