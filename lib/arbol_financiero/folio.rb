module ArbolFinanciero
  class Folio < Resource
    include Mixins::Find
    include Mixins::Where
    include Mixins::Update

    ATTR_IVARS = [:folio, :verticalType, :userFullName,
        :financierName, :status, :statusName,:productName,
        :submittedAt, :closedAt, :changedStatusAt, :hoursInProcess,
        :financialObjectName, :campusName, :studyLevelName,
        :financingPeriods, :financingPeriodLength,
        :financingPeriodAmount, :studyProgram, :scholarship,
        :finishedPeriods, :averageGrade, :financingAmount,
        :applicantEndorsment, :financingPeriods, :financialPurpose]

    attr_reader(*ATTR_IVARS)

    def initialize(id)
      @type = "folios"
      super(id)
    end

    def applicants
      included.select{|i| i.type == "applicants" }
    end
  end
end
