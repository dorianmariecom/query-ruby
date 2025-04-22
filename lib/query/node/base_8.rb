# frozen_string_literal: true

class Query
  class Node
    class Base8 < Node
      attr_accessor :base_8

      def initialize(parsed)
        self.base_8 = parsed
      end

      def evaluate(**_args)
        base_8.to_i(8)
      end
    end
  end
end
