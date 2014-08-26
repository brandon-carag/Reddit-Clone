class User < ActiveRecord::Base;  
  has_many :comments 
  has_many :posts
  has_many :votes

  validates_presence_of :username
  validates :username, uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 8}, on: :create
  has_secure_password

  #TODO: Make sure we're using the correct ActiveRecord callback
  after_validation :generate_slug

  def generate_slug
    self.slug=self.username.tr(" /=","_")
  end

  def to_param
    generate_slug
  end

end

