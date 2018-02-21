module ArbolFinanciero
  class Resource
    attr_reader :id, :type, :links, :included, :relationships

    def initialize(id)
      @id = id
      @included = []
    end

    def self.resource_url
      self.name.demodulize.to_s.camelize(:lower).pluralize
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
          resource_hash = relation_resource_hash(v["data"], included_array)
          add_resource_to_included(resource_hash, included_array)
        when Array
          included_specific_array = included_array.select{|i| i["type"] == k }
          data.each do |d|
            resource_hash = relation_resource_hash(d, included_specific_array)
            add_resource_to_included(resource_hash, included_array)
          end
        end
      end
    end

    private

      def relation_resource_hash(relation_detail, list)
        list.select{|l| l["id"] == relation_detail["id"] && l["type"] == relation_detail["type"] }.first
      end

      def add_resource_to_included(resource_hash, included_array)
        resource = Utils.handle_response(data: resource_hash, included: included_array) if resource_hash
        @included << resource if resource
      end
  end
end