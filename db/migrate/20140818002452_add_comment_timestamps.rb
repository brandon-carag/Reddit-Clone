class AddCommentTimestamps < ActiveRecord::Migration
  def change_table
    add_column(:comments, :created_at, :datetime)
  end
end
