class User < ActiveRecord::Base;  
  has_many :comments 
  has_many :posts

  validates_presence_of :username
  validates :username, uniqueness: {case_sensitive: false}
end
