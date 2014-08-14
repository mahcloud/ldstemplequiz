require 'spec_helper'

RSpec.describe Country, :type => :model do
  it { should have_many(:states) }
  it { should have_many(:temples) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end
