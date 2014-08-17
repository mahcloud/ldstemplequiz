require 'spec_helper'

RSpec.describe Answer, :type => :model do
  it { should validate_presence_of(:temple_id) }
  it { should validate_presence_of(:guess_id) }
  it { should ensure_inclusion_of(:correct).in_array([true,false]) }
  it { should belong_to(:user) }
  it { should belong_to(:temple) }
end
