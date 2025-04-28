# frozen_string_literal: true

class Query
  class Combiner
    def initialize(*sources)
      self.sources = sources
    end

    def self.combine(...)
      new(...).combine
    end

    def combine
      sources
        .map { |source| Query.evaluate(source) }
        .reduce { |acc, element| combine_parsed(acc, element) }
        .then { |parsed| Query.decompile(parsed) }
    end

    private

    attr_accessor :sources

    def combine_parsed(left, right)
      (left + right)
        .reverse
        .uniq { |node| node.is_a?(Hash) ? [node[:key], node[:operator]] : node }
        .reverse
    end
  end
end
