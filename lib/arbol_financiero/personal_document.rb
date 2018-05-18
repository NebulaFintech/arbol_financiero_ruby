# frozen_string_literal: true

module ArbolFinanciero
  class PersonalDocument < Resource
    ATTR_IVARS = %i[documentType document updatedAt].freeze

    attr_reader(*ATTR_IVARS)

    def initialize(id)
      @type = "personalDocuments"
      super(id)
    end
  end
end
