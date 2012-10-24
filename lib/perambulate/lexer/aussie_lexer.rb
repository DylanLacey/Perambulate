require "lexr"

module Perambulate
  AussieLexer = Lexr.that {
    ignores /\s+/ => :whitespace

    matches /\d+/ => :number
    matches /Road|road|rd|Rd|RD/ => :designation
    matches /[,\/-]/ => :separator
    matches /[a-zA-Z]+/ => :place_word
  }
end
