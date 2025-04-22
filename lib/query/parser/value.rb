# frozen_string_literal: true

class Query
  class Parser
    class Value < Language
      def root
        Range | KeyValue | Boolean | Number | String
      end
    end
  end
end
