require 'spec_helper'

RSpec.describe Temple, :type => :model do
  it { should belong_to(:state) }
  it { should belong_to(:country) }
  it { should have_many(:photos) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:state_id) }
  it { should validate_presence_of(:country_id) }
  it { should validate_presence_of(:latitude) }
  it { should validate_presence_of(:longitude) }
  it { should validate_presence_of(:link) }
end
