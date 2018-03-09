module ArbolFinanciero
  class FinancialData < Resource
    ATTR_IVARS = [:netIncomeVerified, :netIncomeVerifiedSecondary, :netIncomeUnverified,
      :netIncomeVerifiedDocument, :netIncomeVerifiedSecondaryDocument, :savings, :statsRooms,
      :statsFlooring, :statsRestrooms, :statsShower, :statsStove, :statsLightbulbs, :statsCars,
      :statsEducation, :incomePaymentFrequency, :incomePaymentType, :bankName, :bankAccount,
      :transferType, :cardOrClabeNumber, :personalExpensesDescription, :financialDataUseConsentment,
      :legalDeclaration, :updatedAt, :monthlyPersonalExpenses]
  
    attr_reader(*ATTR_IVARS)

    def initialize(id)
      @type = "financialData"
      super(id)
    end
  end
end