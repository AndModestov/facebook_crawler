class Group < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 90 }
  validates :url, presence: true
end
