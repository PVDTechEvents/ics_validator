require 'spec_helper'

describe IcsValidator, :vcr do

  describe ".valid_feed?(url)" do

    context "given a valid ICS feed" do
      let(:valid_ics_feed_url) {
        "http://elmcity.cloudapp.net/elmcity/ics?view=art"
      }

      it "returns true" do
        expect(
          described_class.valid_feed?(valid_ics_feed_url)
        ).to be_true
      end
    end

    context "given an invalid ICS feed" do
      let(:invalid_ics_feed_url) {
        "http://example.com/"
      }

      it "returns false" do
        expect(
          described_class.valid_feed?(invalid_ics_feed_url)
        ).to be_false
      end
    end

  end

  describe ".valid_file?(path)" do

    context "given a valid ICS file" do
      let(:valid_ics_file) {
        File.expand_path('../fixtures/icalendar/valid.ics',  __FILE__)
      }

      it "returns true" do
        expect(
          described_class.valid_file?(valid_ics_file)
        ).to be_true
      end
    end

    context "given an invalid ICS file" do
      let(:invalid_ics_file) {
        File.expand_path('../fixtures/icalendar/invalid.ics',  __FILE__)
      }

      it "returns false" do
        expect(
          described_class.valid_file?(invalid_ics_file)
        ).to be_false
      end
    end

  end

  describe ".valid_snippet?(snippet)" do

    context "given a valid ICS snippet" do
      let(:valid_ics_snippet) {
        <<-EOF
BEGIN:VCALENDAR
VERSION:2.0
CALSCALE:GREGORIAN
METHOD:PUBLISH
PRODID:iCalendar-Ruby
BEGIN:VTIMEZONE
TZID:America/New_York
BEGIN:DAYLIGHT
DTSTART:19700308T020000
RRULE:FREQ=YEARLY;BYMONTH=3;BYDAY=2SU
TZNAME:EDT
TZOFFSETFROM:-0500
TZOFFSETTO:-0400
END:DAYLIGHT
BEGIN:STANDARD
DTSTART:19701101T020000
RRULE:FREQ=YEARLY;BYMONTH=11;BYDAY=1SU
TZNAME:EST
TZOFFSETFROM:-0400
TZOFFSETTO:-0500
END:STANDARD
END:VTIMEZONE
END:VCALENDAR
        EOF
      }

      it "returns true" do
        expect(
          described_class.valid_snippet?(valid_ics_snippet)
        ).to be_true
      end
    end

    context "given an invalid ICS snippet" do
      let(:invalid_ics_snippet) {
        "LOL.  THIS ISN'T EVEN CLOSE"
      }

      it "returns false" do
        expect(
          described_class.valid_snippet?(invalid_ics_snippet)
        ).to be_false
      end
    end

  end

end
