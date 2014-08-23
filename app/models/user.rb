class User < ActiveRecord::Base;  
  has_many :comments 
  has_many :posts
  has_many :votes

  validates_presence_of :username
  validates :username, uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 8}, on: :create
  has_secure_password
end
