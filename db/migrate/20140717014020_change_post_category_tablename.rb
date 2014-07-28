class ChangePostCategoryTablename < ActiveRecord::Migration
  def change
    rename_table :postcategories, :post_categories
  end
end
