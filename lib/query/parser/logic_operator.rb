# frozen_string_literal: true

class Query
  class Parser
    class LogicOperator < Language
      def root
        (
          Whitespace << (
            str("and") | str("And") | str("AND") | str("or") | str("Or") |
              str("OR")
          ) << Whitespace
        ) |
          (
            Whitespace.maybe << (
              str("&&") | str("&") | str("||") | str("|") | str("")
            ) << Whitespace.maybe
          )
      end
    end
  end
end
