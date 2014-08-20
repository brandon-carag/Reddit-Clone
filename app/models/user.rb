class User < ActiveRecord::Base;  
  has_many :comments 
  has_many :posts

  validates_presence_of :username
  validates :username, uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 8}
  has_secure_password
end
