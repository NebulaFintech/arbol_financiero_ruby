# frozen_string_literal: true

module ArbolFinanciero
  class Address < Resource
    ATTR_IVARS = %i[street suburb internalNumber externalNumber
                    cityCouncil zipCode state residentYears livingType updatedAt].freeze

    attr_reader(*ATTR_IVARS)

    def initialize(id)
      @type = "addresses"
      super(id)
    end
  end
end
