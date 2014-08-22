class Comment < ActiveRecord::Base; 
  belongs_to :creator, foreign_key: "user_id", class_name: "User"
  belongs_to :post
  has_many :votes, as: :voteable

  validates_presence_of :body, :post_id

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


