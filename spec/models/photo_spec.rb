require 'spec_helper'

RSpec.describe Photo, :type => :model do
  it { should belong_to(:temple) }
  it { should validate_presence_of(:link) }
  it { should validate_presence_of(:temple_id) }
end
