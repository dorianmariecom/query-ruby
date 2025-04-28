# frozen_string_literal: true

class Query
  class Parser
    class Statement < Language
      def root
        (
          Whitespace.maybe << NotOperator.aka(:not) << Whitespace.maybe
        ).maybe << (Group | KeyValue | String)
      end
    end
  end
end
