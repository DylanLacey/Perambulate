module Perambulate
  class Address
    attr_accessor :street_number, :street_name, :suburb, :designation, :postcode, :state

    def initialize(options = {})
      @street_number = options[:street_number]
      @street_name = options[:street_name]
      @designation = options[:designation]
      @suburb = options[:suburb]
      @postcode = options[:postcode]
      @state = options[:state]
    end

  end
end
