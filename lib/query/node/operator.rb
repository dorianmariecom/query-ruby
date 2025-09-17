# frozen_string_literal: true

class Query
  class Node
    class Operator < Node
      attr_accessor :prefix, :suffix

      PREFIXES = { "+" => "", "-" => "!", "!" => "!", "" => "", nil => "" }.freeze

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
      }.freeze

      def initialize(parsed)
        self.prefix = parsed.delete(:prefix)
        self.suffix = parsed.delete(:suffix)
      end

      def evaluate(**_args)
        "#{PREFIXES.fetch(prefix)}#{SUFFIXES.fetch(suffix)}"
      end
    end
  end
end
