require 'capybara/poltergeist'
require 'ics_validator/api_response'

module IcsValidator

  # Validate an iCalendar file.
  #
  class FileValidator

    def initialize(path)
      @path = path
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

      session.attach_file('Content_fileUpload', File.expand_path(@path))

      session.click_button "Content_btnUpload"

      response = nil

      Capybara.send(:timeout, 10, session.driver) do
        response = ApiResponse.build(session.html)
      end

      response
    end

  end
end

