require "test/spec/spec_helper"

describe "Perambulate" do
  describe "As newly included" do
    it "should have 'Australian' as the default parsing strategy" do
      Perambulate.config[:default_parser].should eq "Australian"
    end
  end

  it "should have a Config hash" do
    Perambulate.config.class.to_s.should == "Hash"
  end

  it "should take a Config block" do
    lambda {
      Perambulate.configure do |config|

      end
    }.should_not raise_error
  end

  describe "with a custom configuration" do
    before(:each) do
      Perambulate.configure do |config|
        config[:default_parser] = "Finnish"
      end
    end

    it "should persist configuration values" do
      Perambulate.config[:default_parser].should eq "Finnish"
    end
  end

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