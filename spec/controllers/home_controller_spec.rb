require 'spec_helper'

describe HomeController, type: :controller do
  let!(:country) { Fabricate(:country) }

  describe "GET index" do
    it "it should have countries" do
      get :index
      assigns(:countries).should == [country]
    end
  end
end