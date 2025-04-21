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

      def value
        Boolean.aka(:boolean) |
          Number.aka(:number) |
          String.aka(:string)
      end

      def root
        (
          value.aka(:first) << (
            whitespace? << operator.aka(:operator) <<
            whitespace? << value.aka(:value)
          ).repeat(1).aka(:others).maybe
        ).aka(:range).then do |output|
          output[:range][:others] ? output : output[:range][:first]
        end
      end
    end
  end
end
