require "whittle"
require "lib/perambulate/designations"

module Perambulate
  class Parser < Whittle::Parser

    # Terminal Symbols -- ORDER MATTERS
    rule(:wsp => /\s+/).skip!
    rule(:number => /\d+/)
    rule(:unit_symbol => /Unit|Num|Number|No/i)
    rule(:unit_separator => /\/|-|,/)
    rule(:street_separator => /,/)
    rule(:designation => Perambulate::Designations::PARSELIST)

    rule(:word => /[a-zA-Z]+/)

    rule(:unit_prefix) do |r|
      r[]
      r[:unit_symbol]

    end

    rule(:unit_number) do |r|
      r[:unit_prefix, :number, :unit_separator].as {|_, b, _| b}
      r[:number, :unit_separator].as {|a, _| a}
    end

    rule(:street_number_block) do |r|
      r[:unit_number, :number].as {|a,b| {:unit_number => a, :street_number => b}}
      r[:number].as {|a| {:street_number => a}}
    end

    rule(:name) do |r|
      r[:name, :word].as {|a,b| "#{a} #{b}"}
      r[:word]
    end

    rule(:street_specification) do |r|
      r[:name, :designation].as {|a,b| {:street_name => a, :designation => b}}
    end

    rule(:street_block) do |r|
      r[:street_number_block, :street_specification].as {|a,b| a.merge(b)}
      r[:street_specification]
    end

    rule(:addr) do |r|
      r[:street_block, :optional_suburb_separator, :name].as {|a,_,b| a.merge({:suburb => b})}
      r[:street_block, :name].as {|a,b| a.merge({:suburb => b})}
      r[:street_block]
      r[:name].as {|a| {:suburb => a}}
    end

    rule(:optional_suburb_separator) do |r|
      r[:street_separator]
      r[:unit_separator]


    end

    start(:addr)
  end
end
