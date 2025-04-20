# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = "query-ruby"
  s.version = File.read("VERSION").strip
  s.summary = "a querying language for the internet"
  s.description = s.summary
  s.authors = ["Dorian Marié"]
  s.email = "dorian@dorianmarie.com"
  s.files = `git ls-files`.lines.map(&:strip)
  s.require_paths = ["lib"]
  s.homepage = "https://github.com/dorianmariecom/query-ruby"
  s.license = "MIT"
  s.executables = "query"

  s.add_dependency "activesupport"
  s.add_dependency "bigdecimal"
  s.add_dependency "dorian-arguments"
  s.add_dependency "json"
  s.add_dependency "language-ruby"
  s.add_dependency "zeitwerk"

  s.metadata["rubygems_mfa_required"] = "true"

  s.required_ruby_version = ">= 3.0"
end
