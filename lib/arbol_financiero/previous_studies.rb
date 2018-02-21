module ArbolFinanciero
  class PreviousStudies < Resource
    ATTR_IVARS = [:studiesType, :institutionName, :averageGrade,
      :publicOrPrivate, :updatedAt]
  
    attr_reader(*ATTR_IVARS)

    def initialize(id)
      @type = "previousStudies"
      super(id)
    end
  end
end