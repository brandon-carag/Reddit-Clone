class User < ActiveRecord::Base;  
  has_many :comments 
  has_many :posts

  validates_presence_of :username
end
