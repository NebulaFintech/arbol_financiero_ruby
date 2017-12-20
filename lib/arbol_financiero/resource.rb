module ArbolFinanciero
  class Resource
    attr_reader :id, :type, :links
    def initialize(id)
      @id = id
    end

    def set_attributes(attributes)
      attributes = attributes.with_indifferent_access
      self.class::ATTR_IVARS.map{ |ivar| instance_variable_set("@#{ivar}", attributes[ivar]) }
    end

    def set_links(links)
      @links = Links.new(links)
    end
  end
end