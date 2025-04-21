# frozen_string_literal: true

class Query
  class Parser
    class String < Language
      def double_quote
        str('"')
      end

      def single_quote
        str("'")
      end

      def backslash
        str("\\")
      end

      def special
        str("...") | str("..") | Whitespace | Operator
      end

      def double_quoted_string
        double_quote.ignore << (
          (backslash.ignore << double_quote) | (double_quote.absent << any)
        ).repeat << double_quote.maybe.ignore
      end

      def single_quoted_string
        single_quote.ignore << (
          (backslash.ignore << single_quote) | (single_quote.absent << any)
        ).repeat << single_quote.maybe.ignore
      end

      def root
        (
          (
            double_quoted_string | single_quoted_string |
              (special.absent << any).repeat(1)
          ) << special.present
        ).aka(:string)
      end
    end
  end
end
