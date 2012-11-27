# Require ALL THE THINGS
require "perambulate/address/address"
require "perambulate/lexer/aussie_lexer"
require "perambulate/parser/parser"
require "perambulate/designations"


  module Perambulate

    @@configuration = {:default_parser => "Australian"}

    def self.config
      return @@configuration
    end

    def self.configure(&block)
      yield @@configuration
    end

    def self.create_address(address_string)
      Address.new
    end
  end

