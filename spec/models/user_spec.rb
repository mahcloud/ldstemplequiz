require 'spec_helper'
describe User do
  it { should validate_presence_of(:email) }
  it { should allow_value('foobar@gmail.com').for(:email) }
  it { should_not allow_value('foobargmail.com').for(:email) }
  it { should_not allow_value('foobar@gmailcom').for(:email) }
  it { should_not allow_value('foobar@gmail.').for(:email) }
end