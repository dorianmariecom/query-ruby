# frozen_string_literal: true

class Query
  class Node
    class Part < Node
      attr_accessor :part

      def initialize(parsed)
        if parsed.key?(:key_value)
          self.part = KeyValue.new(parsed.delete(:key_value))
        elsif parsed.key?(:text)
          self.part = Text.new(parsed.delete(:text))
        end
      end

      def evaluate(**args)
        part&.evaluate(**args)
      end
    end
  end
end
