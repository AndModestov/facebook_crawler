class Group < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  validates :name, presence: true, length: { maximum: 90 }
  validates :url, presence: true
end
