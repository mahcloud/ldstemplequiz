require 'spec_helper'

RSpec.describe Continent, :type => :model do
  it { should have_many(:countries) }
  it { should have_many(:temples) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  describe "#has_temples?" do
    let(:continent) { Fabricate(:continent) }

    context "has temples" do
      let!(:country) { Fabricate(:country, :continent_id => continent.id) }
      before(:each) do
        Fabricate(:temple, :country_id => country.id)
      end

      it "should be true" do
        continent.has_temples?.should == true
      end
    end

    context "no temples" do
      it "should be false" do
        continent.has_temples?.should == false
      end
    end
  end
end
