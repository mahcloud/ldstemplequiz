require 'spec_helper'

describe AnswersController, type: :controller do
  let!(:temple) { Fabricate(:temple) }
  let!(:incorrect_temple) { Fabricate(:temple) }

  describe "POST create" do
    before(:each) do
      session[:quiz_temple_id] = temple.id
    end

    context "No Session" do
      it "should be false" do
        post :create, :format => 'json'
        assigns(:correct).should == false
      end
    end

    context "Can't find Temple" do
      it "should be false" do
        post :create, :format => 'json', :temple_id => 0
        assigns(:correct).should == false
      end
    end

    context "User Correct" do
      it "should be true" do
        user = Fabricate(:user)
        sign_in(user)
        post :create, :format => 'json', :temple_id => temple.id
        assigns(:correct).should == true
        assigns(:temple).should == temple
        user.answers.count.should == 1
        user.answers.last.correct.should == true
      end
    end

    context "User Incorrect" do
      it "should be false" do
        user = Fabricate(:user)
        sign_in(user)
        post :create, :format => 'json', :temple_id => incorrect_temple.id
        assigns(:correct).should == false
        assigns(:temple).should == temple
        user.answers.count.should == 1
        user.answers.last.correct.should == false
      end
    end

    context "No User Correct" do
      it "should be true" do
        post :create, :format => 'json', :temple_id => temple.id
        assigns(:correct).should == true
        assigns(:temple).should == temple
        Answer.all.count.should == 1
        Answer.all.last.correct.should == true
      end
    end

    context "No User Incorrect" do
      it "should be false" do
        post :create, :format => 'json', :temple_id => incorrect_temple.id
        assigns(:correct).should == false
        assigns(:temple).should == temple
        Answer.all.count.should == 1
        Answer.all.last.correct.should == false
      end
    end
  end
end
