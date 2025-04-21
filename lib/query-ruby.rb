# frozen_string_literal: true

require "active_support/all"
require "json"
require "language-ruby"
require "zeitwerk"

loader = Zeitwerk::Loader.for_gem(warn_on_extra_files: false)
loader.ignore("#{__dir__}/query-ruby.rb")
loader.setup

class Object
  alias is_an? is_a?
end
