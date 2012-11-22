require "rspec"
require "lib/perambulate"

describe "Address Parsing Interface" do

  describe "Given Australian addresses" do
    it "Should deal with a compact Australia address" do
      test_address = "75 Boston Avenue, Coorparoo QLD"

      expected = Perambulate::Address.new(:street_number => "75",
                             :street_name => "Boston",
                             :designation => Perambulate::Designations::AVENUE,
                             :suburb => "Coorparoo",
                             :state => "Queensland"
      )



    end
  end

end