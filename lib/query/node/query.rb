# frozen_string_literal: true

class Query
  class Node
    class Query < Node
      attr_accessor :left, :operator, :right, :query, :negative

      LOGIC_OPERATORS = {
        "or" => "or",
        "Or" => "or",
        "OR" => "or",
        "||" => "or",
        "|" => "or",
        "and" => "and",
        "And" => "and",
        "AND" => "and",
        "&&" => "and",
        "&" => "and",
        "" => "and",
        nil => "and"
      }

      NEGATIVE_OPERATORS = {
        "not" => "not",
        "Not" => "not",
        "NOT" => "not",
        "!" => "not"
      }

      def initialize(parsed)
        self.negative = (parsed.presence || {}).delete(:not)

        if parsed.is_a?(Hash)
          if parsed.key?(:key_value)
            self.query = KeyValue.new(parsed.delete(:key_value))
          elsif parsed.key?(:string)
            self.query = String.new(parsed.delete(:string))
          else
            self.left = Query.new(parsed.delete(:left))
            self.operator = parsed.delete(:operator)
            self.right = Query.new(parsed.delete(:right))
          end
        else
          self.query = String.new(parsed)
        end
      end

      def evaluate(**args)
        if negative && query
          {
            operator: NEGATIVE_OPERATORS.fetch(negative),
            right: query.evaluate(**args)
          }
        elsif negative
          {
            operator: NEGATIVE_OPERATORS.fetch(negative),
            right: {
              left: left.evaluate(**args),
              operator: LOGIC_OPERATORS.fetch(operator),
              right: right.evaluate(**args)
            }
          }
        elsif query
          query.evaluate(**args)
        else
          {
            left: left.evaluate(**args),
            operator: LOGIC_OPERATORS.fetch(operator),
            right: right.evaluate(**args)
          }
        end
      end
    end
  end
end
