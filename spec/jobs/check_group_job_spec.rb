require 'rails_helper'

RSpec.describe CheckGroupJob, type: :job do
  describe 'get_posts after create' do
    let!(:group){ create(:group) }

    it 'should call CheckGroupJob' do
      expect(FacebookCrawler).to receive(:check_group).with(group.id)
      CheckGroupJob.perform_now(group)
    end
  end
end
