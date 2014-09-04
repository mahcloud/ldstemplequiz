require 'spec_helper'

describe Admin::StatesController, type: :controller do
  let(:admin) { Fabricate(:admin) }
  let!(:state) { Fabricate(:state) }
  let!(:continent) { Fabricate(:continent) }
  let!(:country) { Fabricate(:country, :continent_id => continent.id) }
  let!(:state) { Fabricate(:state, :country_id => country.id) }

  before(:each) do
    sign_in admin
  end

  describe "GET new" do
    it "should set state" do
      get :new, country_id: country.id
      assigns(:state).id.should == nil
    end
  end

  describe "POST create" do
    let!(:count) { State.all.count }

    context "invalid" do
      it "should have errors" do
        post :create, :state => {:name => '', :country_id => 0}
        assigns(:state).errors.any?.should == true
      end
    end

    context "valid" do
      it "should not have errors" do
        post :create, :state => {:name => 'foobar', :country_id => country.id}
        assigns(:state).errors.any?.should == false
      end

      it "should create state" do
        post :create, :state => {:name => 'foobar', :country_id => country.id}
        (count + 1).should == State.count
        assigns(:state).name.should == 'foobar'
      end

      it "should redirect" do
        post :create, :state => {:name => 'foobar', :country_id => country.id}
        response.should redirect_to new_admin_temple_path({continent_id: continent.id, country_id: country.id, state_id: assigns(:state).id})
      end
    end
  end
end
