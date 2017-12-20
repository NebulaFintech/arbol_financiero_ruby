module ArbolFinanciero
  module Utils
    def self.types
      @types ||= {
        "folios" => ::ArbolFinanciero::Folio
      }
    end

    def self.convert_to_object(hash)
      data = hash["data"]
      obj = types[data["type"]].new(data["id"])
      obj.set_attributes(data["attributes"])
      obj.set_relationships(data["relationships"])
      obj.set_links(data["links"])
      obj
    end

  end
end