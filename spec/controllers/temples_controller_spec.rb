require 'spec_helper'

describe TemplesController, type: :controller do
  let!(:continent) { Fabricate(:continent) }

  describe "GET index" do
    it "it should assign continent" do
      get :index, :format => 'json'
      assigns(:continent).should == continent
    end

    it "it should find continent" do
      find_continent = Fabricate(:continent)
      get :index, :continent_id => find_continent.id, :format => 'json'
      assigns(:continent).should == find_continent
    end
  end
end
