require 'spec_helper'

RSpec.describe TeamMember, :type => :model do
  it { should validate_uniqueness_of(:team_id).scoped_to(:user_id) }
  it { should belong_to(:user) }
  it { should belong_to(:team) }
end
