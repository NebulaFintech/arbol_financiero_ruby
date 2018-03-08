module ArbolFinanciero
  class User < Resource

    ATTR_IVARS = [:email, :fullName, :createdAt]

    attr_reader(*ATTR_IVARS)

    def initialize(id)
      @type = "users"
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
      included.select{|i| i.type == "employmentRecords"}
    end

    def personal_documents
      included.select{|i| i.type == "personalDocuments"}
    end
  end
end
