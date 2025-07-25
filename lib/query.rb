# frozen_string_literal: true

class Query
  attr_accessor :source

  def initialize(source)
    self.source = source
  end

  def self.parse(source)
    Parser.parse(source).to_raw
  end

  def self.decompile(parsed)
    Decompiler.decompile(parsed)
  end

  def self.combine(*sources)
    Combiner.combine(*sources)
  end

  def self.evaluate(...)
    new(...).evaluate
  end

  def evaluate
    Node::Query.new(Query.parse(source)).evaluate
  end
end
