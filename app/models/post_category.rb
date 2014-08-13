class PostCategory  < ActiveRecord::Base; 
  belongs_to :post
  belongs_to :category

  validates_presence_of :category_id
  
  #TO DO: The disabled validation below causes the creation of new posts
  #with new categories to fail--why?
  # validates_presence_of :post_id 
   
end

