module ArbolFinanciero
  class CreditReport < Resource
    ATTR_IVARS = [:bureauReportResponse, :bureauReportSavedAt, :updatedAt]
    
    attr_reader(*ATTR_IVARS)

    def initialize(id)
      @type = "creditReports"
      super(id)
    end
  end
end