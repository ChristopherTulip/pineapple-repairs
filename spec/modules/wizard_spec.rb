require 'spec_helper'

class Model < ActiveRecord::Base
  include Wizard

  def steps
    %w[first second third]
  end
end

describe Wizard do

  let(:dummy_class) { Model.new }

  describe :current_step do
    subject { dummy_class.current_step }

    context "with no previous_step" do
      it { should == 'first' }
    end

    context "with current_step initialized" do
      before { dummy_class.current_step = dummy_class.steps[2] }

      it { should == 'third' }
    end
  end

  describe :next_step do
    subject { dummy_class.next_step }

    context "with no previous_step" do
      it { should == 'second' }
    end

    context "at the end of the array" do
      before { dummy_class.current_step = dummy_class.steps[2] }

      it { should == nil }
    end
  end

  describe :previous_step do
    subject { dummy_class.previous_step }

    context "with no previous_step" do
      it { should == 'third' } # -1 in an array returns the last value
    end

    context "at the end of the array" do
      before { dummy_class.current_step = dummy_class.steps[2] }

      it { should == "second" }
    end
  end

  describe :first_step? do
    subject { dummy_class.first_step? }

    context "as the first_step" do
      it { should == true }
    end

    context "as any other step" do
      before { dummy_class.current_step = dummy_class.steps[2] }

      it { should == false }
    end
  end

  describe :last_step? do
    subject { dummy_class.last_step? }

    context "as the last_step" do
      before { dummy_class.current_step = dummy_class.steps[2] }

      it { should == true }
    end

    context "as any other step" do
      it { should == false }
    end
  end
end
