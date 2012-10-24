# Require ALL THE THINGS
require "perambulate/address/address"
require "perambulate/lexer/aussie_lexer"
require "perambulate/parser/parser"


  module Perambulate
    def self.create_address(address_string)
      Address.new
    end
  end

