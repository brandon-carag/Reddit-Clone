class Category < ActiveRecord::Base; 
  has_many :posts
  has_many :post_categories
  has_many :posts, through: :post_categories

  validates_presence_of :name
  validates :name, uniqueness: {case_sensitive: false}

  after_validation :generate_slug

  def generate_slug
    self.slug=self.name.tr(" /=","_")
  end

  def to_param
    generate_slug
  end

end