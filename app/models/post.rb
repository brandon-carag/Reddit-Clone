class Post < ActiveRecord::Base; 

  belongs_to :creator, foreign_key: "user_id", class_name: "User"
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :votes, as: :voteable


  validates_presence_of :url,:title,:description
  validates :url, uniqueness: {case_sensitive: false}

  after_validation :generate_slug
  
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

  def generate_slug
    self.slug="Test Value"
    self.slug=self.title.gsub(" ","_")
    @uniqueness_counter=0

    #Replace bad characters
    #TODO: Search out more bad characters or find a way to whitelist
    self.slug.tr!(" /=","_")

    # Test Uniqueness
    Post.all.each do |post|
      if post.slug==self.slug
      @uniqueness_counter+=1
      end
    end

    if @uniqueness_counter > 0
    self.slug+=@uniqueness_counter.to_s
    end
  end



end