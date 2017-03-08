module ConduitRb
  class Transport
    def initialize(uri, config, params)
      @uri = uri
      @config = config
      @params = params
    end

    def execute
      uri = URI.parse(@uri)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == 'https'
      results = []

      params = {}
      params['api.token'] = @config.api_key
      unless @params.nil?
        params.each_pair do |key, value|
          if value.is_a?(Array)
            value.each_with_index do |value, index|
              params["#{key}[#{index}]"] = value
            end
          else
            params[key] = value
          end
        end
      end 

      request = Net::HTTP::Post.new(uri.request_uri)
      request.set_form_data(params)

      response = http.request(request)
      response.body
    end
  end
end
