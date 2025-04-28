# frozen_string_literal: true

class Query
  class Parser
    class Query < Language
      def root
        Whitespace.maybe << Part.maybe << Whitespace.maybe
      end
    end
  end
end
