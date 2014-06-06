require 'spec_helper'

describe Job do
  let!(:device1)  { create(:device) }
  let!(:model1)   { create(:model, device: device1) }
  let!(:problem1) { create(:problem) }
  let!(:network1) { create(:network) }
  let!(:location) { create(:location) }

  it "should have a valid factory" do
    expect( build(:job) ).to be_all_valid
  end

  let (:job) do
    build(:job)
  end

  describe "steps" do
    it "should return a list of steps" do
      expect(job.steps).to eq(%w[ location device model network problem contact ])
    end
  end


  describe "#data_for_step" do

    let!(:device2) { create(:device, name: "device2") }

    let!(:model2) { create(:model, name: "model2", device: device1) }
    let!(:model3) { create(:model, name: "model3", device: device2) }

    let!(:problem2) { create(:problem, name: "problem2") }
    let!(:problem3) { create(:problem, name: "problem3") }

    let!(:network2) { create(:network) }
    let!(:network3) { create(:network) }

    it "should return devices on the device step" do
      job.current_step = "device"
      expect(job.data_for_step(nil)).to eq([device1, device2])
    end

    it "should return models on the second step" do
      job.current_step = "model"
      expect(job.data_for_step(1)).to eq([model1, model2])
    end

    it "should return problems on the third step" do
      job.current_step = "problem"

      expect(job.data_for_step(1)).to eq([network1, network2, network3])
    end

    it "should return problems on the third step" do
      job.current_step = "problems"

      expect(job.data_for_step(1)).to eq([problem1, problem2, problem3])
    end

    it "should return an empty array on any other step" do
      job.current_step = "asdf"

      expect(job.data_for_step(1)).to eq([])
    end
  end
end
