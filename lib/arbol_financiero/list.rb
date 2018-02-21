module ArbolFinanciero
  class List
    attr_reader :resources, :self, :next, :last
    def initialize(options={})
      options = options.with_indifferent_access
      @resources = options.fetch(:resources)
      @self = options.fetch(:self)
      @next = options.fetch(:next, nil)
      @last = options.fetch(:last, nil)
    end

    def [](index)
      resources[index]
    end

    def first
      resources.first
    end

    def last
      resources.last
    end

    def count
      resources.count
    end

    def each(&block)
      resources.each(&block)
    end
  end
end