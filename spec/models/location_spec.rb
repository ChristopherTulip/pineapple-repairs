require 'spec_helper'

describe Location do
  it "should have a valid factory" do
    expect(build(:location)).to be_valid
  end
end
