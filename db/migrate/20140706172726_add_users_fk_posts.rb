#Migration is for adding the 1:M association Users to Post

class AddUsersFkPosts < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.integer :user_id
    end
  end
end



# class AddUsersFkPosts < ActiveRecord::Migration
  
#   def change_table posts do |t|
#     t.string :user_id
#   end
  
#   end
# end
