# frozen_string_literal: true

class Query
  class Node
    class Text < Node
      attr_accessor :text

      def initialize(parsed)
        self.text = parsed.presence
      end

      def evaluate(**args)
        text
      end
    end
  end
end
