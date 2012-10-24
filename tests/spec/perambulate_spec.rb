require "rspec"
require "test_helper"

describe "Perambulate" do

  describe ".create_address" do

    context "Australian SNum Str Des SubAddress" do
      let(:address) {Perambulate.create_address("775 London Road, Chandler")}

      it "parses a street name, designation and suburb" do
        address.street_name.should eql "London"
        address.street_number.should eql "75"
        address.designation.should eql "Road"
        address.suburb.should eql "Chandler"
      end


    end
  end
end