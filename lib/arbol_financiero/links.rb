module ArbolFinanciero
  class Links
    attr_reader :web, :url
    def initialize(options={})
      options = options.with_indifferent_access
      @web = options.fetch(:web)
      @url = options.fetch(:url)
    end
  end
end