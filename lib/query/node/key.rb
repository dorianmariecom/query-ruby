# frozen_string_literal: true

class Query
  class Node
    class Key < Node
      attr_accessor :key

      def initialize(parsed)
        self.key = parsed.presence
      end

      def evaluate(**args)
        key.to_sym
      end
    end
  end
end
