require 'capybara/poltergeist'

module IcsValidator

  # Validate an iCalendar file.
  #
  class FileValidator

    def initialize(path)
      @path = path
    end

    def valid?
      results = validation_results.children.map{|c| c.attr(:result)}
      results.compact.uniq == ['pass']
    end

  private

    def validation_results
      session = Capybara::Session.new(:poltergeist)

      session.driver.headers = { 'User-Agent' =>
        "Mozilla/5.0 (Macintosh; Intel Mac OS X)" }

      session.visit('http://icalvalid.cloudapp.net/')

      session.attach_file('Content_fileUpload', File.expand_path(@path))

      session.click_button "Content_btnUpload"

      results = nil

      Capybara.send(:timeout, 10, session.driver) do
        doc = Nokogiri::XML(session.html)
        results = doc.at('validationResults')
      end

      results
    end

  end
end

