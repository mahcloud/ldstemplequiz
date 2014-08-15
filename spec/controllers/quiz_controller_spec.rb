require 'spec_helper'

describe QuizController, type: :controller do
  let!(:continent) { Fabricate(:continent) }
  let(:country) { Fabricate(:country, :continent_id => continent.id) }
  let(:state) { Fabricate(:state, :country_id => country.id) }
  let!(:temple) { Fabricate(:temple, :country_id => country.id, :state_id => state.id) }

  describe "GET index" do
    it "it should have continents" do
      get :index
      assigns(:continents).should == [continent]
      assigns(:temple).should == temple
    end
  end
end
