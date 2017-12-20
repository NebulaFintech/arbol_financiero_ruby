module ArbolFinanciero
  module Utils
    def self.types
      @types ||= {
        "folios" => ::ArbolFinanciero::Folio,
        "creditReports" => ::ArbolFinanciero::CreditReports
      }
    end

    def self.from_response(response)
      resource = self.from_data(response["data"])
      resource.set_included(response["included"]) if resource.present?
      resource
    end

    def self.from_data(data)
      if types[data["type"]]
        resource = types[data["type"]].new(data["id"])
        resource.set_attributes(data["attributes"])
        resource.set_relationships(data["relationships"])
        resource.set_links(data["links"])
        resource
      else
        nil
      end
    end
  end
end