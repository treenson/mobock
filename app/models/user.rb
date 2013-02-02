class User < ActiveRecord::Base
	has_secure_password

  attr_accessible :email, :name, :password, :password_confirmation

  validates_presence_of :email
  validates_uniqueness_of :email
	validates_presence_of :name
	validates_uniqueness_of :name
  def self.authenticate(email,password)
  	find_by_email(email).try(:authenticate,password)
  end
end
