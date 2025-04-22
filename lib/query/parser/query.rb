# frozen_string_literal: true

class Query
  class Parser
    class Query < Language
      def whitespace?
        Whitespace.maybe
      end

      def root
        whitespace? << (Part << Whitespace).repeat | any.repeat | whitespace?
      end
    end
  end
end
