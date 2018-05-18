# frozen_string_literal: true

module ArbolFinanciero
  class EmploymentDocument < Resource
    ATTR_IVARS = %i[documentType document updatedAt].freeze

    attr_reader(*ATTR_IVARS)

    def initialize(id)
      @type = "employmentDocuments"
      super(id)
    end
  end
end
