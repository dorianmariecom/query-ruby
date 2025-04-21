# frozen_string_literal: true

class Query
  class Parser
    class Operator < Language
      def root
        str("^:") | str(":^") | str("$:") | str(":$") | str(">:") | str("<:") |
          str("!:") | str("~:") | str(":::") | str("::") | str("!=") |
          str("!") | str("~=") | str("~") | str("$=") | str("$") | str("^=") |
          str("^") | str(">=") | str("<=") | str(">") | str("<") | str("===") |
          str("==") | str("=") | str(":")
      end
    end
  end
end
