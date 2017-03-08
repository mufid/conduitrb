module ConduitRb
  class Endpoint
    def initialize(host, prefix)
      @host = host
      @prefix = prefix
    end
    def method_missing(*args, **kwargs)
      method_name = args.first
      tr = Transport.new("#{@host}/api/#{@prefix}.method_name", kwargs)
      result = tr.execute
      ResponseObject.new(JSON.parse(result))
    end
  end
end
