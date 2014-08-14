require 'spec_helper'

describe Guest do
  it { should_not validate_presence_of(:email) }
  it { should_not validate_presence_of(:password) }
end
