# frozen_string_literal: true

class Query
  class Parser
    class Special < Language
      def root
        str("&") | str("|") | str("(") | str(")") | str("...") | str("..") |
          Whitespace | Operator
      end
    end
  end
end
