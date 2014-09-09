require 'spec_helper'
describe User do
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should allow_value('foobar@gmail.com').for(:email) }
  it { should_not allow_value('foobargmail.com').for(:email) }
  it { should_not allow_value('foobar@gmailcom').for(:email) }
  it { should_not allow_value('foobar@gmail.').for(:email) }
  it { should validate_presence_of(:type) }
  it { should have_many(:answers) }
  it { should have_many(:team_members) }
  it { should have_many(:teams) }

  describe "correct_answers" do
    let!(:user) { Fabricate(:user) }
    before(:each) do
      Fabricate(:answer, :user_id => user.id, :correct => true)
      Fabricate(:answer, :user_id => user.id, :correct => true)
      Fabricate(:answer, :user_id => user.id, :correct => true)
      Fabricate(:answer, :user_id => user.id, :correct => false)
      Fabricate(:answer, :user_id => user.id, :correct => false)
    end

    it "should be 3 answers" do
      user.answers.correct_answers.count.should == 3
    end

    it "should be 2 answers" do
      user.answers.wrong_answers.count.should == 2
    end
  end
end