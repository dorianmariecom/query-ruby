# frozen_string_literal: true

class Query
  class Parser
    class Text < Language
      def root
        str("a:")
      end
    end
  end
end
