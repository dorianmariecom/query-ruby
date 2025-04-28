# frozen_string_literal: true

class Query
  class Parser
    class Value < Language
      def root
        (Range | KeyValue | Boolean | Number | String).aka(:value)
      end
    end
  end
end
