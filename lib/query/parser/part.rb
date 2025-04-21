# frozen_string_literal: true

class Query
  class Parser
    class Part < Language
      def root
        KeyValue | Text
      end
    end
  end
end
