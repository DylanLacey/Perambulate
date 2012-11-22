# Require ALL THE THINGS
require "perambulate/address/address"
require "perambulate/lexer/aussie_lexer"
require "perambulate/parser/parser"
require "perambulate/designations"


  module Perambulate
    def self.create_address(address_string)
      Address.new
    end
  end

