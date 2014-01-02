require 'spec_helper'

describe IcsValidator::SnippetValidator, :vcr do

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

    subject { described_class.new(valid_ics_snippet) }

    describe "#valid?" do
      it "returns true" do
        subject.should be_valid
      end
    end
  end

  context "given an invalid ICS snippet" do
    let(:invalid_ics_snippet) {
      "LOL.  THIS ISN'T EVEN CLOSE"
    }

    subject { described_class.new(invalid_ics_snippet) }

    describe "#valid?" do
      it "returns false" do
        subject.should_not be_valid
      end
    end
  end

end
