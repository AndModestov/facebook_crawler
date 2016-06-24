class Post < ActiveRecord::Base
  belongs_to :group

  validates :link, :group_id, presence: true
end
