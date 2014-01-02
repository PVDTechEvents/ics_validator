require 'capybara/poltergeist'
require 'ics_validator/api_response'

module IcsValidator

  # Validate a snippet of iCalendar content.
  #
  class SnippetValidator

    def initialize(snippet)
      @snippet = snippet
    end

    def valid?
      request_validation.valid?
    end

  private

    def request_validation
      session = Capybara::Session.new(:poltergeist)

      session.driver.headers = { 'User-Agent' =>
        "Mozilla/5.0 (Macintosh; Intel Mac OS X)" }

      session.visit('http://icalvalid.cloudapp.net/')

      session.fill_in('Content_tbSnippet', with: @snippet)

      session.click_button "Content_btnValidateSnippet"

      response = nil

      Capybara.send(:timeout, 20, session.driver) do
        response = ApiResponse.build(session.html)
      end

      response
    end

  end
end
