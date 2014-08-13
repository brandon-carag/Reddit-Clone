class Category < ActiveRecord::Base; 
  has_many :posts
  has_many :post_categories
  has_many :posts, through: :post_categories

  validates_presence_of :name
  validates :name, uniqueness: {case_sensitive: false}
end