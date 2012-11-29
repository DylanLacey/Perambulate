# Require ALL THE THINGS
require "perambulate/address/address"
require "perambulate/lexer/aussie_lexer"
require "perambulate/parser/parser"
require "perambulate/designations"

module Perambulate

  @@configuration = {:default_parser => "Australian"}

  def self.config
    @@configuration
  end

  def self.configure(&block)
    yield @@configuration
  end

  def self.create_address(address_string)
    address = Perambulate::Parser.new().parse(address_string)
  end
end