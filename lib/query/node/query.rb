# frozen_string_literal: true

class Query
  class Node
    class Query < Node
      attr_accessor :parts

      def initialize(parsed)
        self.parts = (parsed.presence || []).map { |part| Part.new(part) }
      end

      def evaluate(**args)
        parts
      end
    end
  end
end
