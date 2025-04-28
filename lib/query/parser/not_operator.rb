# frozen_string_literal: true

class Query
  class Parser
    class NotOperator < Language
      def root
        ((str("not") | str("Not") | str("NOT")) << Whitespace) | str("!")
      end
    end
  end
end
