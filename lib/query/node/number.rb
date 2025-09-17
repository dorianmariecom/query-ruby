# frozen_string_literal: true

class Query
  class Node
    class Number < Node
      attr_accessor :value

      def initialize(parsed)
        self.value =
          if parsed.key?(:decimal)
            Decimal.new(parsed.delete(:decimal))
          elsif parsed.key?(:base_16)
            Base16.new(parsed.delete(:base_16))
          elsif parsed.key?(:base_8)
            Base8.new(parsed.delete(:base_8))
          elsif parsed.key?(:base_2)
            Base2.new(parsed.delete(:base_2))
          else
            Base10.new(parsed.delete(:base_10))
          end
      end

      def evaluate(**args)
        value.evaluate(**args)
      end
    end
  end
end
