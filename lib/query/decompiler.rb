# frozen_string_literal: true

class Query
  class Decompiler
    def initialize(parsed)
      @parsed = parsed
    end

    def self.decompile(...)
      new(...).decompile
    end

    def decompile
      parsed.map { |node| format_value(node) }.join(" ")
    end

    def format_string(string)
    end

    def format_value(value)
      if value.is_a?(Hash)
        "#{value[:key]}#{value[:operator]}#{format_value(value[:value])}"
      elsif value.is_a?(String)
        Query.evaluate(value).many? ? value.inspect : value
      elsif value.is_a?(BigDecimal)
        value.to_s("F")
      elsif value.is_a?(Range)
        left = value.first
        right = value.last
        operator = value.exclude_end? ? "..." : ".."
        "#{format_value(left)}#{operator}#{format_value(right)}"
      else
        value.to_s
      end
    end

    private

    attr_reader :parsed
  end
end
