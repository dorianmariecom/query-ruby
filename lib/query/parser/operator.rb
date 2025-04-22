# frozen_string_literal: true

class Query
  class Parser
    class Operator < Language
      OPERATORS = [
        "^",
        "$",
        ">=",
        "=>",
        "<=",
        "=<",
        "=",
        "<",
        ">",
        "!",
      ]

      MODIFIERS = [
        ":::",
        "::",
        ":",
        "=",
        "",
      ]

      def root
        OPERATORS.flat_map do |operator|
          MODIFIERS.map do |modifier|
            str("#{operator}#{modifier}") |
              str("#{modifier}#{operator}") |
              str(operator)
          end.reduce(&:|).then { operator }
        end.reduce(&:|) |
          MODIFIERS.compact_blank.map do |modifier|
            str(modifier)
          end.reduce(&:|)
      end
    end
  end
end
