class CheckGroupJob < ActiveJob::Base
  queue_as :default

  def perform(group)
    FacebookCrawler.check_group(group.id)
  end
end
