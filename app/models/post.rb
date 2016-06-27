class Post < ActiveRecord::Base
  belongs_to :group

  scope :sort_posts, -> { order('body DESC') }

  validates :link, :group_id, presence: true
end
