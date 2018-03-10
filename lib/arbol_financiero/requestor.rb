# frozen_string_literal: true

module ArbolFinanciero
  class Requestor
    attr_reader :api_key, :secret_key, :connection, :api_base

    def initialize
      fail "ArbolFinanciero.configure has not been called!" unless ArbolFinanciero.configuration

      @api_key = ArbolFinanciero.configuration.api_key
      @secret_key = ArbolFinanciero.configuration.secret_key
      fail "Api key has not been set!" if @api_key.blank?
      fail "Secret key has not been set!" if @secret_key.blank?

      @connection = ArbolFinanciero.configuration.connection
      @api_base = self.class.join_url(ArbolFinanciero.configuration.api_base, ArbolFinanciero.configuration.api_version)
    end

    def self.join_url(url, path)
      url.to_s + "/" + path.to_s
    end

    def request(resource_url, http_method, params={})
      set_headers_for(connection)
      response = connection.method(http_method).call do |request|
        request.url self.class.join_url(api_base, resource_url)
        set_request_params(request, params) if params.present?
      end
      JSON.parse(response.body)
    end

    private

      def set_headers_for(connection)
        connection.headers['x-api-key'] = api_key
        connection.headers['x-signature'] = Signature.new(api_key, secret_key).signature
        connection.headers['Accept'] = "application/vnd.api+json"
        connection.headers['Cache-Control'] = "no-cache"
      end

      def set_request_params(request, params)
        case request.method
        when :post, :put
          request.body = params.to_json
        when :get
          request.params = params
        end
      end
  end
end
