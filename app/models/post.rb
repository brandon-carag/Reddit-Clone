#One Post has a single user
class Post < ActiveRecord::Base; 
  # belongs_to :user
  # Try decommenting this to change the default association name to creator.
  belongs_to :creator, foreign_key: "user_id", class_name: "User"
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :votes, as: :voteable


  validates_presence_of :url,:title,:description
  validates :url, uniqueness: {case_sensitive: false}
  
  # validates_format_of :website, :with => URI::regexp(%w(http https))
  def count_up_votes
    self.votes.where(vote:true).size
  end

  def count_down_votes
    self.votes.where(vote:false).size
  end

  def sum_votes
    count_up_votes - count_down_votes
  end

end