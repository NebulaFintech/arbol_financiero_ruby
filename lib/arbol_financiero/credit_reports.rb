module ArbolFinanciero
  class CreditReports < Resource
    ATTR_IVARS = [:bureauReportResponse, :bureauReportSavedAt, :updatedAt]
    attr_reader(*ATTR_IVARS)

    def initialize(id)
      @type = "creditReports"
      super(id)
    end

    def self.resource_url
      "creditReports"
    end
  end
end