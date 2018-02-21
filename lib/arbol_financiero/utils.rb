module ArbolFinanciero
  module Utils
    def self.types
      @types ||= {
        "folios" => ::ArbolFinanciero::Folio,
        "applicants" => ::ArbolFinanciero::Applicant,
        "creditReports" => ::ArbolFinanciero::CreditReport
      }
    end

    def self.handle_response(response)
      response = response.with_indifferent_access
      data = response["data"]
      included = response["included"]
      case data
      when Hash
        resource = self.build_resource(data)
        if resource
          resource.set_included(included) if included && resource.relationships
          resource
        end
      when Array
        data.map do |d|
          resource = self.build_resource(d)
          if resource
            resource.set_included(included) if included && resource.relationships
            resource
          end
        end
      end
    end

    def self.build_resource(resource_data)
      if types[resource_data["type"]]
        resource = types[resource_data["type"]].new(resource_data["id"])
        resource.set_attributes(resource_data["attributes"])
        resource.set_relationships(resource_data["relationships"])
        resource.set_links(resource_data["links"])
        resource
      end
    end
  end
end
