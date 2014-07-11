class ChangePostidToIntegerComments < ActiveRecord::Migration
  def change
    change_column :comments, :post_id, :integer
    change_column :comments, :user_id, :integer
  end
end
