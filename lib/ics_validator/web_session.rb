require 'capybara/poltergeist'
require 'ics_validator/api_response'

module IcsValidator

  # Capybara session for interacting with icalvalid.cloudapp.net
  #
  class WebSession

    def initialize
      @session = Capybara::Session.new(:poltergeist)

      @session.driver.headers = {
        'User-Agent' => "Mozilla/5.0 (Macintosh; Intel Mac OS X)"
      }

      @session.visit('http://icalvalid.cloudapp.net/')
    end

    def validate_snippet(snippet)
      @session.fill_in('Content_tbSnippet', with: snippet)
      @session.click_button "Content_btnValidateSnippet"
    end

    def validate_file(path)
      @session.attach_file('Content_fileUpload', path)
      @session.click_button "Content_btnUpload"
    end

    def get_api_response
      response = nil

      Capybara.send(:timeout, 20, @session.driver) do
        response = ApiResponse.build(@session.html)
      end

      response
    end

  end
end
