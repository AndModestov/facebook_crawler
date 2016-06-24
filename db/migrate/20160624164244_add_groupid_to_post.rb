class AddGroupidToPost < ActiveRecord::Migration
  def change
    add_belongs_to :posts, :group, index: true, foreign_key: true
  end
end
