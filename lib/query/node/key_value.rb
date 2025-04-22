# frozen_string_literal: true

class Query
  class Node
    class KeyValue < Node
      attr_accessor :key, :operator, :value

      def initialize(parsed)
        self.key = Key.new(parsed.delete(:key))
        self.operator = Operator.new(parsed.delete(:operator))
        self.value = Value.new(parsed.delete(:value))
      end

      def evaluate(**args)
        {
          key: key.evaluate(**args),
          operator: operator.evaluate(**args),
          value: value.evaluate(**args)
        }
      end
    end
  end
end
