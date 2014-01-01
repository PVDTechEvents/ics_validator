require "ics_validator/version"
require "ics_validator/feed_validator"

# Use http://icalvalid.cloudapp.net/ to validate iCalendar content.
#
module IcsValidator

  def self.valid_feed?(url)
    FeedValidator.new(url).valid?
  end

end
