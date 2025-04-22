# frozen_string_literal: true

class Query
  class Node
    class Range < Node
      attr_accessor :left, :right, :operator

      def initialize(parsed)
        self.left = Value.new(parsed.delete(:left))
        self.operator = parsed.delete(:operator)
        self.right = Value.new(parsed.delete(:right))
      end

      def evaluate(**args)
        if operator == "..."
          (left.evaluate(**args))...(right.evaluate(**args))
        else
          (left.evaluate(**args))..(right.evaluate(**args))
        end
      end
    end
  end
end
