# frozen_string_literal: true

class Query
  class Parser
    class Range < Language
      def operator
        str("...") | str("..")
      end

      def whitespace?
        Whitespace.maybe
      end

      def root
        (
          (
            (
              Number.aka(:left) << operator.aka(:operator) << Number.aka(:right)
            ) |
              (
                String.aka(:left) << operator.aka(:operator) <<
                  String.aka(:right)
              )
          ) << Special.present
        ).aka(:range)
      end
    end
  end
end
