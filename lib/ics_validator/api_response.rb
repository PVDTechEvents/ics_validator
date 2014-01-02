require 'nokogiri'

module IcsValidator

  # Response from icalvalid.cloudapp.net API
  #
  class ApiResponse

    def self.build(markup)
      doc = Nokogiri::XML(markup)
      new(doc.at('validationResults'))
    end

    def initialize(validation_results)
      @validation_results = validation_results
    end

    def valid?
      results = @validation_results.children.map{|c| c.attr(:result)}
      results.compact.uniq == ['pass']
    end

  end
end


