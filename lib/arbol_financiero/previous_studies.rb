# frozen_string_literal: true

module ArbolFinanciero
  class PreviousStudies < Resource
    ATTR_IVARS = %i[studiesType institutionName averageGrade
                    publicOrPrivate updatedAt].freeze

    attr_reader(*ATTR_IVARS)

    def initialize(id)
      @type = "previousStudies"
      super(id)
    end
  end
end
