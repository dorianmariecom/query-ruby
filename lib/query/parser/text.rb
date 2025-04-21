# frozen_string_literal: true

class Query
  class Parser
    class Text < Language
      def double_quote
        str('"')
      end

      def single_quote
        str("'")
      end

      def backslash
        str("\\")
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
              (Whitespace.absent << any).repeat(1)
          ) << Whitespace.present
        ).aka(:text)
      end
    end
  end
end
