module ConduitRb
  class ResponseObject
    def initialize(hash)
      @hash = hash
    end
    def method_missing(*args)
      term = args.first
      camelized = StringUtil.camelize(term)
      value = @hash[term] || @hash[camelized]
      return ResponseObject.from_array(value) if value.is_a?(Array)
      return ResponseObject.new(value) if value.is_a?(Hash)
      value
    end

    # Note: can't do nested array
    def self.from_array(arr)
      return [] if arr.empty?
      return arr unless arr.first.is_a?(Hash)
      arr.map { |entry| ResponseObject.new(entry) }
    end
  end
end
