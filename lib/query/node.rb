# frozen_string_literal: true

class Query
  class Node
    def evaluate(**_args)
      Object::Nothing.new
    end
  end
end
