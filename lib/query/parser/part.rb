# frozen_string_literal: true

class Query
  class Parser
    class Part < Language
      def root
        (
          Statement.aka(:left) << LogicOperator.aka(:operator) <<
            Part.aka(:right)
        ) | Statement
      end
    end
  end
end
