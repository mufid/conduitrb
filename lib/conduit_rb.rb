require 'conduit_rb/configuration'
require 'conduit_rb/request_defer'
require 'conduit_rb/response_object'
require 'conduit_rb/string_util'

module ConduitRb

  Configuration.initialize_default

  def configure
    yield Configuration.default_instance
  end

  def initialize(config = Configuration.default)
    @config = config
  end

  include RequestDefer
end
