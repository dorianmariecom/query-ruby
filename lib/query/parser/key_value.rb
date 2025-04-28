# frozen_string_literal: true

class Query
  class Parser
    class KeyValue < Language
      def root
        (Key << Operator << Value).aka(:key_value)
      end
    end
  end
end
