class Group < ActiveRecord::Base
  after_commit :get_posts

  has_many :posts, dependent: :destroy

  validates :name, presence: true, length: { maximum: 90 }
  validates :url, :auth_login, :auth_password, :start_time, :end_time, presence: true

  private

  def get_posts
    CheckGroupJob.perform_later(self)
  end
end
