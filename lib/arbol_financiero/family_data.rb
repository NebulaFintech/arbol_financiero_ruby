module ArbolFinanciero
  class FamilyData < Resource
    ATTR_IVARS = [:maritalStatus, :regimen, :childNumber, :childrenAges,
      :dependents, :spouseName, :spouseFirstSurname, :spouseSecondSurname,
      :spouseBirthDate, :updatedAt]
  
    attr_reader(*ATTR_IVARS)

    def initialize(id)
      @type = "familyData"
      super(id)
    end
  end
end