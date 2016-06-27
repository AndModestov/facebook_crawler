class Like < ActiveRecord::Base
  belongs_to :post

  validates :user, :post_id, presence: true
end
