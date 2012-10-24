# Require ALL THE THINGS
require "perambulate/address/address"
require "perambulate/lexer/aussie_lexer"


  module Perambulate
    def self.create_address(address_string)
      Address.new
    end
  end

