module ArbolFinanciero
  class Address < Resource
    ATTR_IVARS = [:street, :suburb, :internalNumber, :externalNumber,
      :cityCouncil, :zipCode, :state, :residentYears, :livingType, :updatedAt]
  
    attr_reader(*ATTR_IVARS)

    def initialize(id)
      @type = "addresses"
      super(id)
    end
  end
end