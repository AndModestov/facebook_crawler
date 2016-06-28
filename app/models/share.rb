class Share < ActiveRecord::Base
  belongs_to :post

  validates :user, :date, :post_id, presence: true
end
