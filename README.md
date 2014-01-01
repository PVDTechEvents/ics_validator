# IcsValidator

[![Build Status](https://travis-ci.org/mattgillooly/ics_validator.png?branch=master)](https://travis-ci.org/mattgillooly/ics_validator)

Validate iCalendar feeds by URL, using icalvalid.cloudapp.net

Used by [http://pvdtechevents.com](http://pvdtechevents.com) to validate its generated feed.

TODO: Support validating iCalendar snippets and files.

## Installation

Add this line to your application's Gemfile:

    gem 'ics_validator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ics_validator

## Usage

```ruby
IcsValidator.valid_feed?("http://example.com/valid_feed.ics") # => true
IcsValidator.valid_feed?("http://example.com/invalid_feed.ics") # => false
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
