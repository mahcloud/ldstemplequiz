require 'spec_helper'

describe Admin::PhotosController, type: :controller do
  let(:admin) { Fabricate(:admin) }
  let(:temple) { Fabricate(:temple) }

  before(:each) do
    sign_in admin
  end

  describe "GET new" do
    it "should set photo" do
      get :new, temple_id: temple.id
      assigns(:photo).id.should == nil
    end
  end

  describe "POST create" do
    let!(:count) { Photo.all.count }

    context "invalid" do
      it "should have errors" do
        post :create, :photo => {:link => ''}, :temple_id => temple.id
        assigns(:photo).errors.any?.should == true
      end

      it "should have errors" do
        Fabricate(:photo, :temple_id => temple.id, :link => 'foobar')
        post :create, :photo => {:link => 'foobar'}, :temple_id => temple.id
        assigns(:photo).errors.any?.should == true
      end
    end

    context "valid" do
      it "should not have errors" do
        post :create, :photo => {:link => 'foobar'}, :temple_id => temple.id
        assigns(:photo).errors.any?.should == false
      end

      it "should create a photo" do
        post :create, :photo => {:link => 'foobar'}, :temple_id => temple.id
        (count + 1).should == Photo.count
        assigns(:photo).id.should_not be_nil
        assigns(:photo).link.should == 'foobar'
      end

      it "should redirect" do
        post :create, :photo => {:link => 'foobar'}, :temple_id => temple.id
        response.should redirect_to admin_home_path
      end
    end
  end
end
