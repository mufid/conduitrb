# conduit.rb - A dynamically Typed Phabricator API Wrapper for Ruby

A simple wrapper to call Phabricator's Conduit via Ruby.
This Rubygem has no external dependency to other gem.

## Requirement

Ruby >= 2.2 since this gem uses keyword arguments.

## Installation

Put it into `Gemfile`:

    gem 'conduitrb'

or install it manually:

    gem install conduitrb

## Usage

You must configure it before using. You may configure per-instance basis,
or global wide. It is required to configure host URL and API key.

To configure it global wide:

    ConduitRb.configure do |config|
      config.host = 'https://some-url.phacility.com'
      config.api_key = 'xtc-7483483748374783'
    end

To configure it per instance:

    config = ConduitRb::Configuration.new
    config.host = 'https://some-url.phacility.com'
    instance = ConduitRb.new(config)

You can mix global and per instance configuration. Instance configuration
will have higher presedence than global configuration.

    ConduitRb.configure do |config|
      config.host = 'https://some-uri.phacility.com'
      config.api_key = 'xtc-7483483748374783'
    end

    config = ConduitRb::Configuration.new
    config.api_key = 'xtc-11111111'
    instance2 = ConduitRb.new(config)
    # => will have 'xtc-11111111' key

    instance1 = ConduitRb.new
    # => will have 'xtc-7483483748374783' for API key

To call an API, you should refer to Conduit's API documentation.
You can call an API by directly using the dynamic method from
the `instance.<method>`

For the response, each key from the JSON will be translated into 
a ruby method with `ruby_underscore_format`:

    current_user = instance.user.whoami
    current_user.primary_email
    # => mufid@example.com

## Precaution

This is slow since it utilizes on `method_missing` heavily.
