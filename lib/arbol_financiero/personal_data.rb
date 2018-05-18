# frozen_string_literal: true

module ArbolFinanciero
  class PersonalData < Resource
    ATTR_IVARS = %i[name firstSurname secondSurname gender
                    phone mobilePhone birthday birthCountry birthState
                    rfc curp employmentStatus email relationshipWithUser
                    lastStudyLevel cellphoneModel cellphonePayment nickname
                    facebookName personalDataUseConsentment updatedAt].freeze

    attr_reader(*ATTR_IVARS)

    def initialize(id)
      @type = "personalData"
      super(id)
    end
  end
end
