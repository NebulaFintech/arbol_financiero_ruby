# frozen_string_literal: true

module ArbolFinanciero
  class Score < Resource
    ATTR_IVARS = %i[code score scoreText disqualified scoreReason
                    currentDebt financingPeriods financingPeriodLength
                    financingPeriodAmount finishedPeriods totalStudyPeriods
                    financialObjectName institutionName campusName studyLevelName
                    studyProgram userFullName userEmploymentStatus userEmploymentPositionAge
                    jointObligorEmploymentStatus jointObligorEmploymentPositionAge
                    userPreviousStudiesType userPreviousStudiesPublicOrPrivate
                    verticalType createdAt financingAmount applicantEndorsment
                    financingPeriods financialPurpose].freeze

    attr_reader(*ATTR_IVARS)

    def initialize(id)
      @type = "scores"
      super(id)
    end

    def users
      included.select { |i| i.type == "users" }
    end

    def financier_users
      included.select { |i| i.type == "financierUsers" }
    end
  end
end
