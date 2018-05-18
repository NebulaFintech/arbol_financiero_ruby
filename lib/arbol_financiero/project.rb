# frozen_string_literal: true

module ArbolFinanciero
  class Project < Resource
    ATTR_IVARS = %i[applicantEndorsment relationshipWithApplicant relationshipDetail].freeze

    attr_reader(*ATTR_IVARS)

    def initialize(id)
      @type = "project"
      super(id)
    end
  end
end
