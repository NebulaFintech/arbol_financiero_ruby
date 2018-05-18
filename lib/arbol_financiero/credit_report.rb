# frozen_string_literal: true

module ArbolFinanciero
  class CreditReport < Resource
    ATTR_IVARS = %i[bureauReportResponse bureauReportSavedAt updatedAt].freeze

    attr_reader(*ATTR_IVARS)

    def initialize(id)
      @type = "creditReports"
      super(id)
    end
  end
end
