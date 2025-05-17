# frozen_string_literal: true

require_relative "../query"

Query::Version =
  Gem::Version.new(File.read(File.expand_path("../../VERSION", __dir__)))
