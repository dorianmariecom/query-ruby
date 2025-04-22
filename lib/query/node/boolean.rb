# frozen_string_literal: true

class Query
  class Node
    class Boolean < Node
      attr_accessor :boolean

      BOOLEANS = {
        "true" => true,
        "t" => true,
        "True" => true,
        "TRUE" => true,
        "T" => true,
        "yes" => true,
        "y" => true,
        "Yes" => true,
        "YES" => true,
        "Y" => true,
        "on" => true,
        "On" => true,
        "ON" => true,
        "false" => false,
        "f" => false,
        "False" => false,
        "FALSE" => false,
        "F" => false,
        "no" => false,
        "n" => false,
        "No" => false,
        "NO" => false,
        "N" => false,
        "off" => false,
        "Off" => false,
        "OFF" => false,
      }

      def initialize(parsed)
        self.boolean = parsed
      end

      def evaluate(**args)
        BOOLEANS.fetch(boolean)
      end
    end
  end
end
