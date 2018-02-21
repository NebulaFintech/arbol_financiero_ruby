module ArbolFinanciero
  module Mixins
    module Where
      module ClassMethods
        def where(params = {})
          requestor = Requestor.new
          response = requestor.request(resource_url, :get, params)
          Utils.handle_response(response)
        end
      end

      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end
