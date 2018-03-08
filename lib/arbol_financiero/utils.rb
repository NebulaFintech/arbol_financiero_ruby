module ArbolFinanciero
  module Utils
    def self.types
      @types ||= {
        "folios" => ::ArbolFinanciero::Folio,
        "applicants" => ::ArbolFinanciero::Applicant,
        "creditReports" => ::ArbolFinanciero::CreditReport,
        "addresses" => ::ArbolFinanciero::Address,
        "employmentRecords" => ::ArbolFinanciero::EmploymentRecord,
        "familyData" => ::ArbolFinanciero::FamilyData,
        "financialData" => ::ArbolFinanciero::FinancialData,
        "personalData" => ::ArbolFinanciero::PersonalData,
        "personalReferences" => ::ArbolFinanciero::PersonalReference,
        "previousStudies" => ::ArbolFinanciero::PreviousStudies,
        "scores" => ::ArbolFinanciero::Score,
        "users" => ::ArbolFinanciero::User,
        "financierUsers" => ::ArbolFinanciero::FinancierUser,
        "employmentDocuments" => ::ArbolFinanciero::EmploymentDocument,
        "personalDocuments" => ::ArbolFinanciero::PersonalDocument
      }
    end

    def self.handle_response(response)
      response = response.with_indifferent_access
      data = response["data"]
      included = response["included"]
      links = response["links"]
      case data
      when Hash
        self.build_resource(data, included)
      when Array
        list_attributes = links
        list_attributes.merge!(resources: data.map{|d| self.build_resource(d, included)})
        List.new(list_attributes)
      end
    end

    def self.build_resource(resource_data, included)
      if types[resource_data["type"]]
        resource = types[resource_data["type"]].new(resource_data["id"])
        resource.set_attributes(resource_data["attributes"])
        resource.set_relationships(resource_data["relationships"])
        resource.set_links(resource_data["links"])
        resource.set_included(included) if included && resource.relationships
        resource
      end
    end
  end
end
