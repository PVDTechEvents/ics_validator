require "ics_validator/version"
require "ics_validator/web_session"
require "ics_validator/api_response"
require "rest-client"

# Use http://icalvalid.cloudapp.net/ to validate iCalendar content.
#
module IcsValidator

  def self.valid_feed?(url)
    ApiResponse.build(
      RestClient.get("http://icalvalid.cloudapp.net/?uri=#{url}")
    ).valid?
  end

  def self.valid_snippet?(snippet)
    session = WebSession.new
    session.validate_snippet(snippet)
    session.get_api_response.valid?
  end

  def self.valid_file?(path)
    session = WebSession.new
    session.validate_file(File.expand_path(path))
    session.get_api_response.valid?
  end

end
