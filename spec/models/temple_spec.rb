require 'spec_helper'

RSpec.describe Temple, :type => :model do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should belong_to(:state) }
end
