FactoryGirl.define do
  factory :group do
    sequence(:name) { |n| "group-#{n}" }
    url 'http://example.com'
  end
end
