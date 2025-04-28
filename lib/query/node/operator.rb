# frozen_string_literal: true

class Query
  class Node
    class Operator < Node
      attr_accessor :prefix, :suffix

      PREFIXES = { "+" => "", "-" => "!", "!" => "!", "" => "", nil => "" }

      SUFFIXES = {
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
        "===" => "="
      }

      def initialize(parsed)
        self.prefix = parsed.delete(:prefix)
        self.suffix = parsed.delete(:suffix)
      end

      def evaluate(**args)
        "#{PREFIXES.fetch(prefix)}#{SUFFIXES.fetch(suffix)}"
      end
    end
  end
end
