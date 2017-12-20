module ArbolFinanciero
  class Requestor
    attr_reader :api_key, :connection, :api_base
    def initialize
      @api_key = ArbolFinanciero.api_key
      @connection = ArbolFinanciero.connection
      @api_base = self.class.join_url(ArbolFinanciero.api_base, ArbolFinanciero.api_version)
      fail "Api key has not been set!" if @api_key.blank?
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