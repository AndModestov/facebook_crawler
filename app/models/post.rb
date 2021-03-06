class Post < ActiveRecord::Base
  belongs_to :group
  has_many :likes, dependent: :destroy
  has_many :shares, dependent: :destroy

  scope :sort_posts, -> { order('body DESC') }

  validates :link, :group_id, presence: true
end
