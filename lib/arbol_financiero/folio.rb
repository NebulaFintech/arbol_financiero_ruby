module ArbolFinanciero
  class Folio < Resource
    include Mixins::Find
    include Mixins::Where

    ATTR_IVARS = [:folio, :verticalType, :userFullName,
        :financierName, :status, :statusName,:productName,
        :submittedAt, :closedAt, :changedStatusAt, :hoursInProcess,
        :financialObjectName, :campusName, :studyLevelName,
        :financingPeriods, :financingPeriodLength,
        :financingPeriodAmount, :studyProgram, :scholarship,
        :finishedPeriods, :averageGrade]

    attr_reader(*ATTR_IVARS)

    def initialize(id)
      @type = "folios"
      super(id)
    end

    def self.resource_url
      "folios"
    end

    def applicants
      included.select{|i| i.type == "applicants" }
    end
  end
end
