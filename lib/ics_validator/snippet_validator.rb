require 'ics_validator/web_session'

module IcsValidator

  # Validate a snippet of iCalendar content.
  #
  class SnippetValidator

    def initialize(snippet)
      @snippet = snippet
    end

    def valid?
      session = WebSession.new
      session.validate_snippet(@snippet)
      session.get_api_response.valid?
    end

  end
end
