# frozen_string_literal: true

class Query
  class Node
    class Operator < Node
      attr_accessor :operator

      def initialize(parsed)
        self.operator = parsed
      end

      def evaluate(**args)
        operator
      end
    end
  end
end
