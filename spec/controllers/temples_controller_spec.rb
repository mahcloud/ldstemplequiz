require 'spec_helper'

describe TemplesController, type: :controller do
  let!(:country) { Fabricate(:country) }

  describe "GET index" do
    it "it should assign country" do
      get :index, :format => 'json'
      assigns(:country).should == country
    end

    it "it should find country" do
      find_country = Fabricate(:country)
      get :index, :country_id => find_country.id, :format => 'json'
      assigns(:country).should == find_country
    end
  end
end
