require 'rails_helper'

RSpec.describe Group, type: :model do
  it { should validate_presence_of :name }
  it { should validate_length_of(:name).is_at_most(90) }
  it { should validate_presence_of :url }
  it { should validate_presence_of :start_time}
  it { should validate_presence_of :end_time }

  it { should have_many(:posts).dependent(:destroy) }

  describe 'get_posts after create' do
    it 'initiates facebook crawler' do
      group = Group.new(name: 'Test group', url: 'https://www.facebook.com/groups/123456/',
                        auth_login: 'test@example.com', auth_password: '12345678',
                        start_time: '2016-06-20T00:00:00+00:00', end_time: '2016-06-25T00:00:00+00:00')
      expect(CheckGroupJob).to receive(:perform_later).with(group)
      group.save && group.committed!
    end
  end
end