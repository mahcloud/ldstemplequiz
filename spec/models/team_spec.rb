require 'spec_helper'

RSpec.describe Team, :type => :model do
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:name) }
  it { should have_many(:team_members) }
  it { should have_many(:users).through(:team_members) }
  it { should belong_to(:leader) }

  describe "leader_name" do
    let(:team) { Fabricate(:team, :leader_id => nil) }

    context "no leader" do
      it "should return No Leader" do
        team.leader_name.should == 'No Leader'
      end
    end

    context "leader" do
      let(:leader) { Fabricate(:user) }
      let(:team) { Fabricate(:team, :leader_id => leader.id) }

      it "should return leader name" do
        team.leader_name.should == leader.email
      end
    end
  end
end
