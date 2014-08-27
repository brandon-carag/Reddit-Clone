module Voteable
extend ActiveSupport::Concern

  included do
  puts "Voteable module included. -Brandon"
  has_many :votes, as: :voteable
  end

  def count_up_votes
    self.votes.where(vote:true).size
  end

  def count_down_votes
    self.votes.where(vote:false).size
  end

  def sum_votes
    count_up_votes - count_down_votes
  end

  module ClassMethods
  end    

end