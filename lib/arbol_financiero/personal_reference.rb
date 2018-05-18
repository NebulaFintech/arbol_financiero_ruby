# frozen_string_literal: true

module ArbolFinanciero
  class PersonalReference < Resource
    ATTR_IVARS = %i[name firstSurname secondSurname phone
                    mobilePhone contactTime referenceType extension updatedAt].freeze

    attr_reader(*ATTR_IVARS)

    def initialize(id)
      @type = "personalReferences"
      super(id)
    end
  end
end
