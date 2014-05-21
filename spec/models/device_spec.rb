require 'spec_helper'

describe Device do
  it "should have a valid facotry" do
    expect(build(:device)).to be_valid
  end
end
