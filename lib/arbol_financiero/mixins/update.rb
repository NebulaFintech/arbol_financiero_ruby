module ArbolFinanciero
  module Mixins
    module Update
      def update(params = {})
        requestor = Requestor.new
        response = requestor.request(Requestor.join_url(self.class.resource_url, id), :put, params)
        Utils.handle_response(response)
      end
    end
  end
end
