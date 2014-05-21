require 'spec_helper'

describe Model do
  it "should have a valid factory" do
    expect(build(:model)).to be_valid
  end
end
