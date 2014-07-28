class CreatePostCategory < ActiveRecord::Migration
  def change
    create_table :postcategories do |x|
      x.integer :post_id, :category_id
    end
  end
end
