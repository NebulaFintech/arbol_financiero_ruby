# frozen_string_literal: true

module ArbolFinanciero
  class FinancialAsset < Resource
    ATTR_IVARS = %i[financialAssetType vehicleBrand vehicleYear
                    vehiclePaid propertyType propertyDeed propertyPaid createdAt
                    updatedAt researchableId researchableType value otherAssetsDescription sourceId].freeze

    attr_reader(*ATTR_IVARS)

    def initialize(id)
      @type = "financialAssets"
      super(id)
    end
  end
end
