require "rspec"
require "test_helper"

describe "AussieLexer" do

  context "Single Words" do

    it "should return separator" do
      parsed = Perambulate::AussieLexer.new(",").next

      parsed.type.should eql :separator
      parsed.value.should eql ","
    end

    it "should return separator" do
      parsed = Perambulate::AussieLexer.new("-").next

      parsed.type.should eql :separator
      parsed.value.should eql "-"
    end

    it "should return separator" do
      parsed = Perambulate::AussieLexer.new("/").next

      parsed.type.should eql :separator
      parsed.value.should eql "/"
    end
  end

  context "Normal Street Address" do
    let(:lexer) {Perambulate::AussieLexer.new("775 London Road Chandler")}

    it "should return four components" do
      number = lexer.next
      number.type.should eql :number
      number.value.should eql "775"

      street = lexer.next
      street.type.should eql :place_word
      street.value.should eql "London"

      designation = lexer.next
      designation.type.should eql :designation
      designation.value.should eql "Road"

      suburb = lexer.next
      suburb.type.should eql :place_word
      suburb.value.should eql "Chandler"
    end
  end

  context "Separated Street Address" do
    let (:lexer) {Perambulate::AussieLexer.new("775 London Road, Chandler")}

    it "should return all components" do
      expected_results = [
          [:number, "775"],
          [:place_word, "London"],
          [:designation, "Road"],
          [:separator, ","],
          [:place_word, "Chandler"]
      ]
      expected_iterator = expected_results.each
      actual = lexer.next

      until lexer.end?
        result = expected_iterator.next

        puts "Actual: #{actual} expected #{result}"
        actual.type.should eql result[0]
        actual.value.should eql result[1]

        actual = lexer.next
      end
    end
  end
end