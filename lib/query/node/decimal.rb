# frozen_string_literal: true

class Query
  class Node
    class Decimal < Node
      attr_accessor :decimal, :exponent

      def initialize(parsed)
        self.decimal = parsed.delete(:decimal)

        return unless parsed.key?(:exponent)

        self.exponent = Value.new(parsed.delete(:exponent))
      end

      def evaluate(**args)
        if exponent
          BigDecimal(decimal) * (10**exponent.evaluate(**args))
        else
          BigDecimal(decimal)
        end
      end
    end
  end
end
