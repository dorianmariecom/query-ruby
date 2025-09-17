# frozen_string_literal: true

require "spec_helper"

RSpec.describe Query do
  [
    "",
    " ",
    " \n",
    "\n",
    "      ",
    "     \n    ",
    "       \n",
    " \r",
    "\r",
    "      ",
    "     \r    ",
    "       \r",
    "    \r\n  ",
    "    hello  ",
    "    hello  world",
    "    'hello world'  \r\n",
    ' "hello world"    ',
    "from:me",
    "to:me",
    "from:me to:me",
    "age>30",
    "age>=30",
    "age<30",
    "age<=30",
    "age:1",
    "age:1.0",
    "age:1.10",
    "age:01",
    "age:01.1",
    "age:01.10",
    "age:01.10",
    "age:0b110",
    "age:0x690",
    "age:0o690",
    "age:0B110",
    "age:0X690",
    "age:0O690",
    "user:given_name:dorian",
    "user:family_name:Marié",
    'user:name:"Dorian Marié"',
    "program:user:name:dorian",
    "user:given_name:dorian",
    "user:dorian",
    "age:20..30",
    "age:20...30",
    "age:32.1",
    "age:32.1..32.9",
    "verified:true",
    "verified:t",
    "verified:on",
    "verified:yes",
    "verified:false",
    "verified:f",
    "verified:off",
    "verified:no",
    "a b",
    "a or b",
    "a:1 or b",
    "a:1 or b:2..3",
    "(a or b) and (not b ! c)"
  ].each do |source|
    it source.inspect do
      described_class.evaluate(source)
    end

    it "decompiles #{source.inspect}" do
      expect(described_class.evaluate(described_class.decompile(described_class.evaluate(source)))).to eq(
        described_class.evaluate(source)
      )
    end
  end
end
