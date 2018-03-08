module ArbolFinanciero
  class EmploymentDocument < Resource

    ATTR_IVARS = [:documentType, :document, :updatedAt]

    attr_reader(*ATTR_IVARS)

    def initialize(id)
      @type = "employmentDocuments"
      super(id)
    end
  end
end
