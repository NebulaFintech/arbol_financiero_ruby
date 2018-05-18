# frozen_string_literal: true

module ArbolFinanciero
  class FinancierUser < Resource
    ATTR_IVARS = %i[email name createdAt].freeze

    attr_reader(*ATTR_IVARS)

    def initialize(id)
      @type = "financierUsers"
      super(id)
    end
  end
end
