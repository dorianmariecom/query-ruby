# frozen_string_literal: true

class Query
  class Parser
    class Operator < Language
      PREFIXES = [
        "-",
        "+",
        "!",
        ""
      ]

      OPERATORS = [
        "^",
        "$",
        ">=",
        "=>",
        "<=",
        "=<",
        "<",
        ">",
        "!"
      ]

      MODIFIERS = [
        ":::",
        "::",
        ":",
        "===",
        "==",
        "=",
        "",
      ]

      def root
        PREFIXES.map { |prefix| str(prefix) }.reduce(&:|).aka(:prefix) <<
        (
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
        ).aka(:operator)
      end
    end
  end
end
