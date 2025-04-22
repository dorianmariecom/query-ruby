# frozen_string_literal: true

class Query
  class Node
    class Base2 < Node
      attr_accessor :base_2

      def initialize(parsed)
        self.base_2 = parsed
      end

      def evaluate(**_args)
        base_2.to_i(2)
      end
    end
  end
end
