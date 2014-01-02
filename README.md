# IcsValidator

[![Build Status](https://travis-ci.org/mattgillooly/ics_validator.png?branch=master)](https://travis-ci.org/mattgillooly/ics_validator)
[![Gem Version](https://badge.fury.io/rb/ics_validator.png)](http://badge.fury.io/rb/ics_validator)
[![Code Climate](https://codeclimate.com/github/mattgillooly/ics_validator.png)](https://codeclimate.com/github/mattgillooly/ics_validator)
[![Coverage Status](https://coveralls.io/repos/mattgillooly/ics_validator/badge.png)](https://coveralls.io/r/mattgillooly/ics_validator)

Validate iCalendar content, using [http://icalvalid.cloudapp.net/](http://icalvalid.cloudapp.net/).
If this gem reports a failed validation, your best bet is to manually re-validate your content via the website for more actionable feedback.

Used by [http://pvdtechevents.com/](http://pvdtechevents.com/) to validate its generated feed.


## Installation

Add this line to your application's Gemfile:

    gem 'ics_validator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ics_validator

## Usage

```ruby
# validate an online feed by URL
IcsValidator.valid_feed?("http://example.com/valid_feed.ics") # => true
IcsValidator.valid_feed?("http://example.com/invalid_feed.ics") # => false

# validate a String snippet of iCalendar content
IcsValidator.valid_snippet?("BEGIN:VCALENDAR...")

# validate an iCalendar file
IcsValidator.valid_file?("path/to/local/feed.ics")
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
