FactoryGirl.define do

  factory :group do
    sequence(:name) { |n| "group-#{n}" }
    url 'http://example.com'
    auth_login 'test@email.com'
    auth_password '12345678'
    start_time '2016-06-20T00:00:00+00:00'
    end_time '2016-06-25T00:00:00+00:00'
  end

  factory :invalid_group, class: 'Group' do
    sequence(:name) { |n| "group-#{n}" }
    url nil
  end
end
