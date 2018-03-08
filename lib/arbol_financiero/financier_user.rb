module ArbolFinanciero
  class FinancierUser < Resource

    ATTR_IVARS = [:email, :name, :createdAt]

    attr_reader(*ATTR_IVARS)

    def initialize(id)
      @type = "financierUsers"
      super(id)
    end
  end
end
