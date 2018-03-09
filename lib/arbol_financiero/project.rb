module ArbolFinanciero
  class Project < Resource

    ATTR_IVARS = [:applicantEndorsment, :relationshipWithApplicant, :relationshipDetail]

    attr_reader(*ATTR_IVARS)

    def initialize(id)
      @type = "project"
      super(id)
    end
  end
end
