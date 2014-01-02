require 'ics_validator/web_session'

module IcsValidator

  # Validate an iCalendar file.
  #
  class FileValidator

    def initialize(path)
      @path = path
    end

    def valid?
      session = WebSession.new
      session.validate_file(File.expand_path(@path))
      session.get_api_response.valid?
    end

  end
end

