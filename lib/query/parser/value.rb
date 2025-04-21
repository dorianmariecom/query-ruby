# frozen_string_literal: true

class Query
  class Parser
    class Value < Language
      def root
        KeyValue | Boolean | Number | String | Range
      end
    end
  end
end
