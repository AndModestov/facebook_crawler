class AddPostidToShares < ActiveRecord::Migration
  def change
    add_belongs_to :shares, :post, index: true, foreign_key: true
  end
end
