require 'spec_helper'

RSpec.describe State, :type => :model do
  it { should have_many(:temples) }
  it { should belong_to(:country) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end
