module ConduitRb
  class Configuration

    attr_accessor :host
    attr_accessor :api_key

    def initialize
    end

    def self.default
      @default.dup
    end

    # Private API
    def self.initialize_default
      @default = Configuration.new
    end

    # Private API
    def self.default_instance
      @default
    end
  end
end
