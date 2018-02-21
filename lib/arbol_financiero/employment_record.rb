module ArbolFinanciero
  class EmploymentRecord < Resource
    ATTR_IVARS = [:organizationName, :organizationType, :activityType,
      :positionName, :immediateChiefPosition, :positionAge, :phone,
      :street, :suburb, :externalNumber, :internalNumber, :cityCouncil,
      :zipCode, :state, :referenceName, :referenceFirstSurname,
      :referenceSecondSurname, :referenceType, :referencePhone,
      :referenceExtension, :organizationWebsite, :updatedAt]
  
    attr_reader(*ATTR_IVARS)

    def initialize(id)
      @type = "employmentRecords"
      super(id)
    end
  end
end