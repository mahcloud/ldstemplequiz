require 'spec_helper'

describe PhotosController, type: :controller do
  let!(:temple) { Fabricate(:temple) }

  describe "GET index" do
    it "it should assign temple" do
      get :index, :format => 'json'
      assigns(:temple).should == temple
    end

    it "it should find temple" do
      find_temple = Fabricate(:temple)
      get :index, :temple_id => find_temple.id, :format => 'json'
      assigns(:temple).should == find_temple
    end
  end
end
