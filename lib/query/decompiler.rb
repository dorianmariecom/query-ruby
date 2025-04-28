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
      if parsed.is_a?(Hash) && parsed.key?(:left)
        format_logic_operator(parsed)
      elsif parsed.is_a?(Hash) && parsed.key?(:right)
        format_not_operator(parsed)
      else
        format_value(parsed)
      end
    end

    def format_logic_operator(parsed)
      left = self.class.decompile(parsed[:left])
      right = self.class.decompile(parsed[:right])

      "(#{left} #{parsed[:operator]} #{right})"
    end

    def format_not_operator(parsed)
      right = self.class.decompile(parsed[:right])

      "(#{parsed[:operator]} #{right})"
    end

    def format_value(value)
      if value.is_a?(Hash)
        "#{value[:key]}#{value[:operator]}#{format_value(value[:value])}"
      elsif value.is_a?(String)
        Query.evaluate(value).is_a?(Hash) ? value.inspect : value
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
