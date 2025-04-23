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
      sources.map do |source|
        Query.evaluate(source)
      end.reduce do |acc, element|
        combine_parsed(acc, element)
      end.then do |parsed|
        Query.decompile(parsed)
      end
    end

    private

    attr_accessor :sources

    def combine_parsed(left, right)
      (left + right).reverse.uniq do |node|
        node.is_a?(Hash) ? [node[:key], node[:operator]] : node
      end.reverse
    end
  end
end
