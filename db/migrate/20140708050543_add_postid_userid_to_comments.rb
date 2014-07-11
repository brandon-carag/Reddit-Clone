class AddPostidUseridToComments < ActiveRecord::Migration
  def change
    add_column :comments,:user_id, :string
    add_column :comments,:post_id, :string
  end
end
