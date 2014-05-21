require 'spec_helper'

describe Network do
  it "should have a valid facotry" do
    expect(build(:network)).to be_valid
  end
end
