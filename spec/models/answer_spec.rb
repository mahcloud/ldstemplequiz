require 'spec_helper'

RSpec.describe Answer, :type => :model do
  it { should validate_presence_of(:temple_id) }
  it { should validate_presence_of(:guess_id) }
  it { should ensure_inclusion_of(:correct).in_array([true,false]) }
  it { should belong_to(:user) }
  it { should belong_to(:temple) }

  describe "correct_answers" do
    before(:each) do
      Fabricate(:answer, :correct => true)
      Fabricate(:answer, :correct => true)
      Fabricate(:answer, :correct => true)
      Fabricate(:answer, :correct => false)
      Fabricate(:answer, :correct => false)
    end

    it "should be 3 answers" do
      Answer.correct_answers.count.should == 3
    end

    it "should be 2 answers" do
      Answer.wrong_answers.count.should == 2
    end
  end
end
