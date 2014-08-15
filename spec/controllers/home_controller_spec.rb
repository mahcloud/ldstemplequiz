require 'spec_helper'

describe HomeController, type: :controller do
  let!(:continent) { Fabricate(:continent) }

  describe "GET index" do
    it "it should have countries" do
      get :index
      assigns(:continents).should == [continent]
    end
  end
end