require 'nokogiri'
require 'rest-client'

module IcsValidator

  # Validate an iCalendar feed by URL.
  #
  class FeedValidator

    def initialize(feed_url)
      @feed_url = feed_url
    end

    def valid?
      if r = validation_results
        results = r.children.map{|c| c.attr(:result)}
        results.compact.uniq == ['pass']
      end
    end

  private

    def validator_url
      "http://icalvalid.cloudapp.net/?uri=#{@feed_url}"
    end

    def validator_response
      RestClient.get(validator_url)
    end

    def validator_response_doc
      Nokogiri::XML(validator_response)
    end

    def validation_results
      validator_response_doc.at('validationResults')
    end

  end
end
