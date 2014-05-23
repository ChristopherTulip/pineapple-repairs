require 'spec_helper'

describe Contractor do
  it "should have a valid factory" do
    expect(build(:contractor)).to be_valid
  end
end
