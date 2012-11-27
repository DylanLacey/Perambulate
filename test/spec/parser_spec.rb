require "test/spec/spec_helper"

describe "Parser" do
  context "When short-circuited with single terminals" do
    let(:parser){Perambulate::Parser.new()}
    it "should return a digit for street number" do
      parser.parse("48", :rule => :street_number_block).should eql({:street_number => "48"})

    end

    it "should return street for Zigzag" do
      parser.parse("Zigzag", :rule => :name).should eql "Zigzag"
    end

    it "should not return anything" do
      parser.parse("48a", :rule => :street_number_block).should raise_exception (Whittle::ParseError)
    end

    it "should correctly parse a designation" do
      parser.parse("Street", :rule => :designation).should eql "Street"
    end
  end

  context "When short-circuited with street names" do
    let(:parser){Perambulate::Parser.new()}

    it "should return a hash with the name and number" do
      parser.parse("48 Zigzag Street", :rule=>:street_block).should eql({:street_number => "48", :street_name => "Zigzag", :designation => "Street"})
    end
  end

  context "When given unit numbers" do
    let(:parser){Perambulate::Parser.new()}

    it "should return a unit and street number for slashes" do
      parser.parse("1/65", :rule => :street_number_block).should eql({:unit_number => "1", :street_number => "65"})
    end

    it "should return a unit and street number for dashes" do
      parser.parse("1-65", :rule => :street_number_block).should eql({:unit_number => "1", :street_number => "65"})
    end

    it "should return a unit and street number for commas" do
      parser.parse("1,65", :rule => :street_number_block).should eql({:unit_number => "1", :street_number => "65"})
    end

    it "should return a unit and street number when surrounded by spaces" do
      parser.parse("1 / 65", :rule => :street_number_block).should eql({:unit_number => "1", :street_number => "65"})
    end

    it "should return a unit and street number when preceeded by unit" do
      parser.parse("Unit 5 / 65", :rule => :street_number_block).should eql({:unit_number => "5", :street_number => "65"})
    end

  end
  context "Parsing completely" do
    let(:parser){Perambulate::Parser.new()}

    it "should return a hash with just street details" do
      parser.parse("Zigzag Street").should eql({:street_name => "Zigzag", :designation => "Street"})
    end

    its "should return a hash with just number, street details" do
      parser.parse("48 Zigzag Street").should eql({:street_number => "48", :street_name => "Zigzag", :designation => "Street"})
    end

    it "should return a hash with just a suburb" do
      parser.parse("Red Hill").should eql({:suburb => "Red Hill"})
    end

    it "should return a hash with street name and suburb" do
      parser.parse("Zigzag Street, Red Hill").should eql({:street_name => "Zigzag", :designation => "Street", :suburb => "Red Hill"})
    end

    it "should return a hash with street name and suburb without a comma" do
      parser.parse("Zigzag Street Red Hill").should eql({:street_name => "Zigzag", :designation => "Street", :suburb => "Red Hill"})
    end

    it "should return a hash with everything" do
      parser.parse("48 Zigzag Street, Red Hill").should eql({:street_number => "48", :street_name => "Zigzag", :designation => "Street", :suburb=>"Red Hill"})
    end

    it "should return a unit number for a street address" do
      parser.parse("1/48 Zigzag Street, Red Hill").should eql({:unit_number => "1", :street_number=>"48", :street_name => "Zigzag", :designation=>"Street", :suburb=>"Red Hill"})
    end

    it "should return a unit number for a street address starting with unit" do
      parser.parse("Unit 1/48 Zigzag Street, Red Hill").should eql({:unit_number => "1", :street_number=>"48", :street_name => "Zigzag", :designation=>"Street", :suburb=>"Red Hill"})
    end

  end
end