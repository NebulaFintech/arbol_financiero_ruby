# frozen_string_literal: true

module ArbolFinanciero
  module Mixins
    module Find
      module ClassMethods
        def find(id, params = {})
          requestor = Requestor.new
          response = requestor.request(Requestor.join_url(resource_url, id), :get, params)
          Utils.handle_response(response)
        end
      end

      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end
