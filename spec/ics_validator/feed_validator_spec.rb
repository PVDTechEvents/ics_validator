require 'spec_helper'

describe IcsValidator::FeedValidator, :vcr do

  context "given a valid ICS feed" do
    let(:valid_ics_feed_url) {
      "http://elmcity.cloudapp.net/elmcity/ics?view=art"
    }

    subject { described_class.new(valid_ics_feed_url) }

    describe "#valid?" do
      it "returns true" do
        subject.should be_valid
      end
    end
  end

  context "given an invalid ICS feed" do
    let(:invalid_ics_feed_url) {
      "http://example.com/"
    }

    subject { described_class.new(invalid_ics_feed_url) }

    describe "#valid?" do
      it "returns false" do
        subject.should_not be_valid
      end
    end
  end

end
