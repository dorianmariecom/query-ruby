# frozen_string_literal: true

class Query
  class Parser
    class KeyValue < Language
      def root
        (Key.aka(:key) << Operator.aka(:operator) << Value.aka(:value)).aka(
          :key_value
        )
      end
    end
  end
end
