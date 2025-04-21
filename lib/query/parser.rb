# frozen_string_literal: true

class Query
  class Parser
    def initialize(source)
      @source = source
    end

    def self.parse(...)
      new(...).parse
    end

    def parse
      Query.parse(source)
    end

    private

    attr_reader :source
  end
end
