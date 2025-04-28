# frozen_string_literal: true

class Query
  class Parser
    class Key < Language
      def root
        (Special.absent << Operator.absent << any).repeat(1).aka(:key)
      end
    end
  end
end
