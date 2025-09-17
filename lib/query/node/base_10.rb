# frozen_string_literal: true

class Query
  class Node
    class Base10 < Node
      attr_accessor :whole, :exponent

      def initialize(parsed)
        self.whole = parsed.delete(:whole)
        return unless parsed.key?(:exponent)

        self.exponent =
          Node::Value.new(parsed.delete(:exponent))
      end

      def evaluate(**args)
        exponent ? whole.to_i * (10**exponent.evaluate(**args)) : whole.to_i
      end
    end
  end
end
