module ArbolFinanciero
  class Resource
    attr_reader :id, :type, :links, :included

    def initialize(id)
      @id = id
    end

    def set_attributes(attributes)
      attributes = attributes.with_indifferent_access
      self.class::ATTR_IVARS.map{ |ivar| instance_variable_set("@#{ivar}", attributes[ivar]) }
    end

    def set_links(links)
      @links = Links.new(links) if links.present?
    end

    def set_relationships(relationships)
      nil
    end

    def set_included(included_attrs)
      @included ||= []
      return if included_attrs.blank?

      included_attrs.each do |data|
        resource = Utils.resource_from_data(data)
        @included << resource if resource.present?
      end
    end
  end
end
