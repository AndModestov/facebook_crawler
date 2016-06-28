require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should validate_presence_of :link }
  it { should validate_presence_of :group_id }
  it { should belong_to :group }
  it { should have_many(:likes).dependent(:destroy) }
  it { should have_many(:shares).dependent(:destroy) }
end
