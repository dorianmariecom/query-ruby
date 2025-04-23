# frozen_string_literal: true

class Query
  class Node
    class Operator < Node
      attr_accessor :operator

      OPERATORS = {
        "^" => "^",
        "$" => "$",
        ">=" => ">=",
        "=>" => ">=",
        "<=" => "<=",
        "=<" => "<=",
        "<" => "<",
        ">" => ">",
        "!" => "!",
        ":::" => ":",
        "::" => ":",
        ":" => ":",
        "=" => "=",
        "==" => "=",
        "===" => "=",
      }

      def initialize(parsed)
        self.operator = parsed
      end

      def evaluate(**args)
        OPERATORS.fetch(operator)
      end
    end
  end
end
