require 'spec_helper'

describe Job do
  let (:job) { build(:job) }

  pending "add some examples to (or delete) #{__FILE__}"

  describe "steps" do
    it "should return a list of steps" do
      expect(job.steps).to eq(%w[ device model problem ])
    end
  end
end
