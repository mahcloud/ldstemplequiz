require 'spec_helper'

describe TemplesController, type: :controller do
  let!(:continent) { Fabricate(:continent) }
  let!(:temple) { Fabricate(:temple, :name => 'def', :country_id => Fabricate(:country, :continent_id => continent.id).id) }
  let!(:find_continent) { Fabricate(:continent) }
  let!(:find_temple) { Fabricate(:temple, :name => 'abc', :country_id => Fabricate(:country, :continent_id => find_continent.id).id) }

  describe "GET index" do
    it "it should assign continent" do
      get :index, :format => 'json'
      assigns(:temples).count.should == 2
      assigns(:temples).should == [find_temple, temple]
    end

    it "it should find continent" do
      get :index, :continent_id => find_continent.id, :format => 'json'
      assigns(:temples).should == [find_temple]
    end
  end
end
