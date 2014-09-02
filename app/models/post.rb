class Post < ActiveRecord::Base; 
  include Voteable

  belongs_to :creator, foreign_key: "user_id", class_name: "User"
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories
  # has_many :votes, as: :voteable


  validates_presence_of :url,:title,:description
  validates :url, uniqueness: {case_sensitive: false}

  after_validation :generate_slug
  
  # validates_format_of :website, :with => URI::regexp(%w(http https))

  def generate_slug 
    @uniqueness_counter=0
    #TODO: Search out more bad characters or find a way to whitelist
    #Replace bad characters
    self.slug=self.title.tr(" /=","_")

    

    # Test Uniqueness
    # Post.all.each do |post|
    #   if post.slug==self.slug
    #   @uniqueness_counter+=1
    #   end
    # end

    #Let's say, for the sake of argument, you wanted to allow your business users to create posts that had the same title.
    #when you're slugging, it sounds as if you'd need to test whether a title was unique so that you wouldn't
    #have multiple slugging routes pointing to the same URL.  The problem is, if the rails routing system
    #is utilizing the same slug_generation method when generating URLs, won't it be generating the wrong URLs

    if @uniqueness_counter > 0
      self.slug+=@uniqueness_counter.to_s
      else
      self.slug
    end
  end

  def to_param
    generate_slug
  end

end