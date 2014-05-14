require 'spec_helper'

describe Job do
  let (:job) { build(:job) }

  pending "add some examples to (or delete) #{__FILE__}"

  describe "steps" do
    it "should return a list of steps" do
      expect(job.steps).to eq(%w[ device model network problem location contact])
    end
  end

  describe "#data_for_step" do

    let!(:device1) { create(:device, name: "device1") }
    let!(:device2) { create(:device, name: "device2") }

    let!(:model1) { create(:model, name: "model1", device_id: device1.id) }
    let!(:model2) { create(:model, name: "model2", device_id: device1.id) }
    let!(:model3) { create(:model, name: "model3", device_id: device2.id) }

    let!(:problem1) { create(:problem, name: "problem1") }
    let!(:problem2) { create(:problem, name: "problem2") }
    let!(:problem3) { create(:problem, name: "problem3") }

    it "should return devices on the first step" do
      expect(job.data_for_step(nil)).to eq([device1, device2])
    end

    it "should return models on the second step" do
      job.next_step
      expect(job.data_for_step(1)).to eq([model1, model2])
    end

    it "should return problems on the third step" do
      2.times do
        job.next_step
      end

      expect(job.data_for_step(1)).to eq([problem1, problem2, problem3])
    end

    it "should return an empty array on the fourth step" do
      3.times do
        job.next_step
      end

      expect(job.data_for_step(1)).to eq([])
    end
  end
end
