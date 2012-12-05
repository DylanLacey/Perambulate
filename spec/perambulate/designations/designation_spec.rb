require "test/spec/spec_helper"
require "lib/perambulate/designations/designation"

describe "Designation" do

  it "should take a street name as a parameter" do
    lambda {
      designation = Perambulate::Designation.new("Street")
    }.should_not raise_exception
  end

  context "newly created" do
    let(:designation){Perambulate::Designation.new("Street")}

    it "should have no abbreviations" do
      test_designation.abbreviations.should eq([])
    end
  end
end