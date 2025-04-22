# frozen_string_literal: true

class Query
  class Node
    class String < Node
      attr_accessor :string

      def initialize(parsed)
        self.string = parsed
      end

      def evaluate(**args)
        string.to_s
      end
    end
  end
end
