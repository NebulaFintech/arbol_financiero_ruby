module ArbolFinanciero
  class Applicant < Resource

    ATTR_IVARS = [:fullName]

    attr_reader(*ATTR_IVARS)

    def initialize(id)
      @type = "applicants"
      super(id)
    end

    def credit_reports
      included.select{|i| i.type == "creditReports"}
    end

    def addresses
      included.select{|i| i.type == "addresses"}
    end

    def financial_data
      included.select{|i| i.type == "financialData"}
    end

    def personal_data
      included.select{|i| i.type == "personalData"}
    end

    def employment_records
      included.select{|i| i.type == "employmentRecord"}
    end

    def personal_documents
      included.select{|i| i.type == "personalDocument"}
    end
  end
end
