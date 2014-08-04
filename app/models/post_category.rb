class PostCategory  < ActiveRecord::Base; 
  belongs_to :post
  belongs_to :category

   validates_presence_of :post_id,:category_id
end

