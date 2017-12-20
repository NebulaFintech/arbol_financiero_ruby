module ArbolFinanciero
  attr_reader :resources, :current_page, :first_page, :last_page, :previous_page, :next_page
  class List
    def initialize(options={})
      options = options.with_indifferent_access
      @resources = options.fetch(:resources)
      @current_page = options.fetch(:current_page)
      @first_page = options.fetch(:first_page, nil)
      @last_page = options.fetch(:last_page, nil)
      @previous_page = options.fetch(:previous_page, nil)
      @next_page = options.fetch(:next_page, nil)
    end
  end
end