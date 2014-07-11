class Comment < ActiveRecord::Base; 
  belongs_to :user
end



# belongs_to :post,foreign_key: :post_id