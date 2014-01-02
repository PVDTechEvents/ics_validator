require 'spec_helper'

describe IcsValidator::FileValidator, :vcr do

  context "given a valid ICS file" do
    let(:valid_ics_file) {
      File.expand_path('../../fixtures/icalendar/valid.ics',  __FILE__)
    }

    subject { described_class.new(valid_ics_file) }

    describe "#valid?" do
      it "returns true" do
        subject.should be_valid
      end
    end
  end

  context "given an invalid ICS file" do
    let(:invalid_ics_file) {
      File.expand_path('../../fixtures/icalendar/invalid.ics',  __FILE__)
    }

    subject { described_class.new(invalid_ics_file) }

    describe "#valid?" do
      it "returns false" do
        subject.should_not be_valid
      end
    end
  end

end
