require 'spec_helper'

describe Problem do
  it "should have a valid factory" do
    expect(build(:problem)).to be_valid
  end
end
