# frozen_string_literal: true

module ArbolFinanciero
  class FamilyData < Resource
    ATTR_IVARS = %i[maritalStatus regimen childNumber childrenAges
                    dependents spouseName spouseFirstSurname spouseSecondSurname
                    spouseBirthDate updatedAt].freeze

    attr_reader(*ATTR_IVARS)

    def initialize(id)
      @type = "familyData"
      super(id)
    end
  end
end
