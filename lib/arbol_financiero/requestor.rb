module ArbolFinanciero
  class Requestor
    attr_reader :api_key, :secret_key, :connection, :api_base
    def initialize
      @api_key = ArbolFinanciero.configuration.api_key
      @secret_key = ArbolFinanciero.configuration.secret_key
      @connection = ArbolFinanciero.configuration.connection
      @api_base = self.class.join_url(ArbolFinanciero.configuration.api_base, ArbolFinanciero.configuration.api_version)
      set_headers_for(connection)
      fail "Api key has not been set!" if @api_key.blank?
      fail "Secret key has not been set!" if @secret_key.blank?
    end

    def self.join_url(url, path)
      url.to_s + "/" + path.to_s
    end

    def request(resource_url, method, params={})
      response = connection.method(http_method).call do |request|
        request.url = self.class.join_url(api_base, resource_url)
        set_request_params(request, params) if params.present?
      end
      JSON.parse(response.body)
    end

    private

      def set_headers_for(connection)
        connection.headers['Host'] = 'application/json'
        connection.headers['x-api-key'] = api_key
        connection.headers['x-signature'] = signature
        connection.headers['Accept'] = "application/vnd.api+json"
        connection.headers['Cache-Control'] = "no-cache"
      end

      def signature
        timestamp = Time.now.to_i
        timestamp = timestamp.to_s.slice(0, 9)
        raw_signature = "#{self.api_key}#{timestamp}"
        digest = OpenSSL::Digest.new("sha1")
        OpenSSL::HMAC.hexdigest(digest, secret_key, raw_signature)
      end


      def set_request_params(request, params)
        case request.method
        when :post
          request.body = params.to_json
        when :get
          request.params = params
        end
      end
  end
end