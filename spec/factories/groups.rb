FactoryGirl.define do
  factory :group do
    sequence(:name) { |n| "group-#{n}" }
    url 'http://example.com'
  end

  factory :invalid_group, class: 'Group' do
    sequence(:name) { |n| "group-#{n}" }
    url nil
  end
end
