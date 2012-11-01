require "whittle"

module Perambulate
  class Parser < Whittle::Parser

    # Terminal Symbols -- ORDER MATTERS
    rule(:wsp => /[\s+|,\/-]/).skip!
    rule(:number => /\d+/)
    rule(:unit => /[Unit|Num|Number|No\.]/i) ^ 2
    rule(:designation => /Street/)

    rule(:word => /[a-zA-Z]+/)

    rule(:name) do |r|
      r[:name, :word].as {|a,b| "#{a} #{b}"}
      r[:word]
    end

    rule(:street_number_block) do |r|
      r[:unit_number, :number].as {|a,b| {:unit_number => a, :street_number => b}}
      r[:number].as {|a| {:street_number => a}}
    end

    rule(:unit_symbol) do |r|
      r[:unit]
      r[]
    end

    rule(:unit_number) do |r|
      r[:unit_symbol, :number].as {|a, b| b}
    end

    rule(:street_specification) do |r|
      r[:name, :designation].as {|a,b| {:street_name => a, :designation => b}}
    end

    rule(:street_block) do |r|
      r[:street_number_block, :street_specification].as {|a,b| a.merge(b)}
      r[:street_specification]
    end

    rule(:addr) do |r|
      r[:street_block, :name].as {|a,b| a.merge({:suburb => b})}
      r[:street_block]
      r[:name].as {|a| {:suburb => a}}
    end

    start(:addr)
  end
end
