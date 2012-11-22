require "rspec"
require "lib/perambulate"

describe "A new address" do
  describe "Passed an options hash" do
    let(:address) {Perambulate::Address.new(  :street_number => "75",
                                              :street_name=>"Boston",
                                              :designation => Perambulate::Designations::AVENUE,
                                              :suburb => "Coorparoo",
                                              :postcode => "4104",
                                              :state => "QLD"
    )}

    it "should have instantiated with its values set" do
      address.street_number.should == "75"
      address.street_name.should == "Boston"
      address.designation.should == Perambulate::Designations::AVENUE
      address.suburb.should == "Coorparoo"
      address.postcode.should == "4104"
      address.state.should == "QLD"
    end

  end
end