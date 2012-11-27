require "rspec"
require "lib/perambulate"
require "factory_girl"

FactoryGirl.find_definitions

describe "Address Parsing Interface" do

  describe "Given Australian addresses" do
    it "Should deal with a compact Australia address" do
      test_address = "75 Boston Avenue, Coorparoo QLD"

      expected = FactoryGirl.build(:address, :street_number => "75",
                             :street_name => "Boston",
                             :designation => Perambulate::Designations::AVENUE,
                             :suburb => "Coorparoo",
                             :state => "Queensland"
      )
    end

    it "Should deal with an expanded Australian address" do
      test_address = "75 Boston Avenue, Coorparoo Queensland"
    end

    it "Should deal with a unit number compact Australiam address" do
      test_address = "Unit 1, 75 Boston Avenue, Coorparoo QLD"
    end

    it "Should deal with a post code" do
      test_address = "73 Boston Avenue, Coorparoo QLD 4234"

    end

  end

end