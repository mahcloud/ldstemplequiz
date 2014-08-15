require 'spec_helper'

RSpec.describe Continent, :type => :model do
  it { should have_many(:countries) }
  it { should have_many(:temples) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end
