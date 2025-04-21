# frozen_string_literal: true

class Query
  class Parser
    class Whitespace < Language
      def space
        str(" ")
      end

      def newline
        str("\n") | str("\r")
      end

      def root
        (space | newline).repeat(1).ignore | any.absent
      end
    end
  end
end
