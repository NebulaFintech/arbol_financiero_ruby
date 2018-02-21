module ArbolFinanciero
  class PersonalReference < Resource
    ATTR_IVARS = [:name, :firstSurname, :secondSurname, :phone,
      :mobilePhone, :contactTime, :referenceType, :extension, :updatedAt]
  
    attr_reader(*ATTR_IVARS)

    def initialize(id)
      @type = "personalReferences"
      super(id)
    end
  end
end