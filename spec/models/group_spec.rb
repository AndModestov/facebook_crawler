require 'rails_helper'

RSpec.describe Group, type: :model do
  it { should validate_presence_of :name }
  it { should validate_length_of(:name).is_at_most(90) }
  it { should validate_presence_of :url }

  it { should have_many(:posts).dependent(:destroy) }
end