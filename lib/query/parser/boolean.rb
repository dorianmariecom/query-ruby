# frozen_string_literal: true

class Query
  class Parser
    class Boolean < Language
      def special
        str("...") | str("..") | Whitespace | Operator
      end

      def root
        (
          (
            (
              str("true") | str("t") | str("True") | str("TRUE") | str("T") |
                str("yes") | str("y") | str("Yes") | str("YES") | str("Y") |
                str("on") | str("On") | str("ON")
            ).aka(:true) |
              (
                str("false") | str("f") | str("False") | str("FALSE") |
                  str("F") | str("no") | str("n") | str("No") | str("NO") |
                  str("N") | str("off") | str("Off") | str("OFF")
              ).aka(:false)
          ) << special.present
        ).aka(:boolean)
      end
    end
  end
end
