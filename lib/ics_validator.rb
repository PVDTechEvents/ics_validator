require "ics_validator/version"
require "ics_validator/feed_validator"
require "ics_validator/snippet_validator"
require "ics_validator/file_validator"

# Use http://icalvalid.cloudapp.net/ to validate iCalendar content.
#
module IcsValidator

  def self.valid_feed?(url)
    FeedValidator.new(url).valid?
  end

  def self.valid_snippet?(snippet)
    SnippetValidator.new(snippet).valid?
  end

  def self.valid_file?(path)
    FileValidator.new(path).valid?
  end

end
