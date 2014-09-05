require 'spec_helper'

RSpec.describe Team, :type => :model do
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:name) }
  it { should have_many(:team_members) }
  it { should have_many(:users).through(:team_members) }
end
