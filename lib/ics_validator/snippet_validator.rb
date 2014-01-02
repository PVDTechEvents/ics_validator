require 'capybara/poltergeist'

module IcsValidator

  # Validate a snippet of iCalendar content.
  #
  class SnippetValidator

    def initialize(snippet)
      @snippet = snippet
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

      session.fill_in('Content_tbSnippet', with: @snippet)

      session.click_button "Content_btnValidateSnippet"

      results = nil

      Capybara.send(:timeout, 20, session.driver) do
        doc = Nokogiri::XML(session.html)
        results = doc.at('validationResults')
      end

      results
    end

  end
end
