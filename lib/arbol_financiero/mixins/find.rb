module ArbolFinanciero
  module Mixins
    module Find
      module ClassMethods
        def find(id)
          requestor = Requestor.new
          response = requestor.request(Requestor.join_url(resource_url, id), :get)
          Utils.from_response(response)
        end
      end
      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end