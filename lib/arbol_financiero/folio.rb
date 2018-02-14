module ArbolFinanciero
  class Folio < Resource
    include Mixins::Find

    ATTR_IVARS = [:folio, :verticalType, :userFullName,
        :financierName, :status, :statusName,:productName,
        :submittedAt, :closedAt, :changedStatusAt, :hoursInProcess,
        :financialObjectName, :campusName, :studyLevelName,
        :financingPeriods, :financingPeriodLength,
        :financingPeriodAmount, :studyProgram, :scholarship,
        :finishedPeriods, :averageGrade]

    attr_reader :productId, :applicantId
    attr_reader(*ATTR_IVARS)

    def initialize(id)
      @type = "folios"
      super(id)
    end

    def self.resource_url
      "folios"
    end

    def set_relationships(relationships)
      @productId = relationships["product"]["data"]["id"] rescue nil
      @applicantId = relationships["applicant"]["data"]["id"] rescue nil
    end
  end
end
