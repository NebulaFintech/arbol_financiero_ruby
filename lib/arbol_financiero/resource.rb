module ArbolFinanciero
  class Resource
    attr_reader :id, :type, :links, :included, :relationships

    def initialize(id)
      @id = id
      @included = []
    end

    def set_attributes(attributes)
      attributes = attributes.with_indifferent_access
      self.class::ATTR_IVARS.map{ |ivar| instance_variable_set("@#{ivar}", attributes[ivar]) }
    end

    def set_links(links)
      @links = Links.new(links) if links.present?
    end

    def set_relationships(relationships)
      @relationships = relationships
    end

    def set_included(included_array)
      relationships.each do |k, v|
        data = v["data"]
        case data
        when Hash
          resource_hash = included_array.select{|i| i["id"] == v["data"]["id"] && i["type"] == v["data"]["type"] }.first
          resource = Utils.handle_response(data: resource_hash, included: included_array) if resource_hash
          @included << resource if resource
        when Array
          included_specific_array = included_array.select{|i| i["type"] == k }
          data.each do |d|
            resource_hash = included_specific_array.select{|i| i["id"] == d["id"] && i["type"] == d["type"] }.first
            resource = Utils.handle_response(data: resource_hash, included: included_specific_array) if resource_hash
            @included << resource if resource
          end
        end
      end
    end
  end
end
