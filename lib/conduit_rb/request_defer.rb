module ConduitRb
  module RequestDefer
    def initialize(host)
      @host = host
    end
    def method_missing(*args)
      Endpoint.new(@host, args.first)
    end
  end
end
