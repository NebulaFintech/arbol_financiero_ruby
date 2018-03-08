module ArbolFinanciero
  class PersonalDocument < Resource

    ATTR_IVARS = [:documentType, :document, :updatedAt]

    attr_reader(*ATTR_IVARS)

    def initialize(id)
      @type = "personalDocuments"
      super(id)
    end
  end
end
