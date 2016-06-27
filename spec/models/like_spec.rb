require 'rails_helper'

RSpec.describe Like, type: :model do
  it { should validate_presence_of :user }
  it { should validate_presence_of :post_id }
  it { should belong_to :post }
end
