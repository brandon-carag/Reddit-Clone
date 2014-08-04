#One Post has a single user
class Post < ActiveRecord::Base; 
  # belongs_to :user
  # Try decommenting this to change the default association name to creator.
  belongs_to :creator, foreign_key: "user_id", class_name: "User"
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories

  validates_presence_of :url,:title,:description
  # validates_format_of :website, :with => URI::regexp(%w(http https))
end