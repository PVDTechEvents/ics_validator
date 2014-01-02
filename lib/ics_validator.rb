require "ics_validator/version"
require "ics_validator/feed_validator"
require "ics_validator/snippet_validator"

# Use http://icalvalid.cloudapp.net/ to validate iCalendar content.
#
module IcsValidator

  def self.valid_feed?(url)
    FeedValidator.new(url).valid?
  end

  def self.valid_snippet?(snippet)
    SnippetValidator.new(snippet).valid?
  end

end
