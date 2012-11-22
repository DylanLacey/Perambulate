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

  describe "Not passed an options hash" do
    let (:address) {Perambulate::Address.new()}

    it "should have nils for all options" do
      address.street_number.should be_nil
      address.street_name.should be_nil
      address.designation.should be_nil
      address.suburb.should be_nil
      address.postcode.should be_nil
      address.state.should be_nil
    end
  end
end