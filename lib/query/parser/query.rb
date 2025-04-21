# frozen_string_literal: true

class Query
  class Parser
    class Query < Language
      def whitespace?
        Whitespace.maybe
      end

      def root
        (whitespace? << Part << whitespace?).repeat
      end
    end
  end
end
