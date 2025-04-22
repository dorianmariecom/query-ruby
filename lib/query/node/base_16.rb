# frozen_string_literal: true

class Query
  class Node
    class Base16 < Node
      attr_accessor :base_16

      def initialize(parsed)
        self.base_16 = parsed
      end

      def evaluate(**_args)
        base_16.to_i(16)
      end
    end
  end
end
