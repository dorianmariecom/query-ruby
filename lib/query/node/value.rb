# frozen_string_literal: true

class Query
  class Node
    class Value < Node
      attr_accessor :value

      def initialize(parsed)
        if parsed.key?(:key_value)
          self.value = KeyValue.new(parsed.delete(:key_value))
        elsif parsed.key?(:boolean)
          self.value = Boolean.new(parsed.delete(:boolean))
        elsif parsed.key?(:number)
          self.value = Number.new(parsed.delete(:number))
        elsif parsed.key?(:string)
          self.value = String.new(parsed.delete(:string))
        elsif parsed.key?(:range)
          self.value = Range.new(parsed.delete(:range))
        end
      end

      def evaluate(**args)
        value.evaluate(**args)
      end
    end
  end
end
