require "whittle"

module Perambulate
  class Parser < Whittle::Parser

    rule(:wsp => /[\s+|,\/-]/).skip!
    rule(:designation => /Street/)
    rule(:number => /\d+/)
    rule(:word => /[a-zA-Z]+/)

    rule(:name) do |r|
      r[:name, :word].as {|a,b| "#{a} #{b}"}
      r[:word]
    end

    rule(:street_number_block) do |r|
      r[:number, :number].as {|a,b| {:unit_number => a, :street_number => b}}
      r[:number].as {|a| {:street_number => a}}
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
