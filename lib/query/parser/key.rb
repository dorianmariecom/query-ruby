# frozen_string_literal: true

class Query
  class Parser
    class Key < Language
      def root
        (Whitespace.absent << Operator.absent << any).repeat(1)
      end
    end
  end
end
