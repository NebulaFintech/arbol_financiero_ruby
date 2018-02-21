module ArbolFinanciero
  class Applicant < Resource

    ATTR_IVARS = [:fullName]

    attr_reader(*ATTR_IVARS)

    def initialize(id)
      @type = "applicants"
      super(id)
    end

    def self.resource_url
      "applicants"
    end

    def credit_reports
      included.select{|i| i.type == "creditReports"}
    end
  end
end
