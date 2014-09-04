require 'spec_helper'

describe Admin::TemplesController, type: :controller do
  let(:admin) { Fabricate(:admin) }
  let!(:temple) { Fabricate(:temple) }
  let!(:continent) { Fabricate(:continent) }
  let!(:country) { Fabricate(:country, :continent_id => continent.id) }
  let!(:state) { Fabricate(:state, :country_id => country.id) }

  before(:each) do
    sign_in admin
  end

  describe "GET index" do
    it "should list all temples" do
      get :index
      assigns(:temples).should == [temple]
    end
  end

  describe "GET show" do
    it "should set temple" do
      get :show, :id => temple.id
      assigns(:temple).name.should == temple.name
    end
  end

  describe "GET new" do
    it "should set temple" do
      get :new
      assigns(:temple).id.should == nil
    end
  end

  describe "POST create" do
    let!(:new_temple) { Fabricate.build(:temple) }
    let!(:count) { Temple.all.count }

    context "invalid" do
      it "should have errors" do
        post :create, :continent_id => continent.id, :country_id => country.id, :state_id => state.id, :temple => {}
        assigns(:temple).errors.any?.should == true
      end

      it "should redirect" do
        post :create
        response.should redirect_to new_admin_temple_path
      end
    end

    context "valid" do
      it "should not redirect to 404" do
        post :create, :continent_id => continent.id, :country_id => country.id, :state_id => state.id, :temple => {name: new_temple.name, address: new_temple.address, link: new_temple.link, longitude: new_temple.longitude, latitude: new_temple.latitude}
        response.should redirect_to admin_temples_path
      end

      it "should not have errors" do
        post :create, :continent_id => continent.id, :country_id => country.id, :state_id => state.id, :temple => {name: new_temple.name, address: new_temple.address, link: new_temple.link, longitude: new_temple.longitude, latitude: new_temple.latitude}
        assigns(:temple).errors.any?.should == false
      end

      it "should create temple" do
        post :create, :continent_id => continent.id, :country_id => country.id, :state_id => state.id, :temple => {name: new_temple.name, address: new_temple.address, link: new_temple.link, longitude: new_temple.longitude, latitude: new_temple.latitude}
        (count + 1).should == Temple.count
        assigns(:temple).name.should == new_temple.name
      end

      it "should redirect" do
        post :create, :continent_id => continent.id, :country_id => country.id, :state_id => state.id, :temple => {name: new_temple.name, address: new_temple.address, link: new_temple.link, longitude: new_temple.longitude, latitude: new_temple.latitude}
        response.should redirect_to admin_temples_path
      end
    end
  end
end
