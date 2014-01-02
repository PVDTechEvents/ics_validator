require 'capybara/poltergeist'

module IcsValidator

  # Validate an iCalendar file.
  #
  class FileValidator

    def initialize(path)
      @path = path
    end

    def valid?
      if r = validation_results
        results = validation_results.children.map{|c| c.attr(:result)}
        results.compact.uniq == ['pass']
      else
        raise "unexpected markup"
      end
    end

  private

    def validator_response
      session = Capybara::Session.new(:poltergeist)

      session.driver.headers = { 'User-Agent' =>
        "Mozilla/5.0 (Macintosh; Intel Mac OS X)" }

      session.visit('http://icalvalid.cloudapp.net/')

      session.attach_file('Content_fileUpload', File.expand_path(@path))

      session.click_button "Content_btnUpload"

      session.html
    end

    def validator_response_doc
      Nokogiri::XML(validator_response)
    end

    def validation_results
      validator_response_doc.at('validationResults')
    end

  end
end

