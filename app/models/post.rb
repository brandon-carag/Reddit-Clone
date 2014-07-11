#One Post has a single user
class Post < ActiveRecord::Base; 
  belongs_to :user,foreign_key: :user_id
  has_many :comments, foreign_key: :post_id
end