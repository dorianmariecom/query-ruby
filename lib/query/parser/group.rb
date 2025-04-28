# frozen_string_literal: true

class Query
  class Parser
    class Group < Language
      def root
        str("(").ignore << Whitespace.maybe << Part.maybe <<
          (Whitespace.maybe << str(")").ignore).maybe
      end
    end
  end
end
