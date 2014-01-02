require 'rest-client'
require 'ics_validator/api_response'

module IcsValidator

  # Validate an iCalendar feed by URL.
  #
  class FeedValidator

    def initialize(feed_url)
      @feed_url = feed_url
    end

    def valid?
      request_validation.valid?
    end

  private

    def request_validation
      ApiResponse.build(
        RestClient.get(
          "http://icalvalid.cloudapp.net/?uri=#{@feed_url}"
        )
      )
    end

  end
end
