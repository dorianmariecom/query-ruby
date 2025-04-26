# frozen_string_literal: true

class Query
  class Node
    class Operator < Node
      attr_accessor :prefix, :operator

      PREFIXES = {
        "+" => "",
        "-" => "!",
        "!" => "!",
        "" => "",
      }

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
        self.prefix = parsed.delete(:prefix)
        self.operator = parsed.delete(:operator)
      end

      def evaluate(**args)
        "#{PREFIXES.fetch(prefix)}#{OPERATORS.fetch(operator)}"
      end
    end
  end
end
