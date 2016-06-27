class AddPostIdToLikes < ActiveRecord::Migration
  def change
    add_belongs_to :likes, :post, index: true, foreign_key: true
  end
end
