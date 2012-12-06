require "spec_helper"

describe "Designations" do

  describe "#parselist" do
    it "should respond to parselist" do
      Perambulate::Designations.respond_to?(:parselist).should be_true
    end
    
    it "should return a regex" do
      Perambulate::Designations.parselist.class.should eq Regexp.new(/a/).class
    end
  end

  describe "#all" do
    it "should return a list of all designations" 
  end

  describe "#count" do
  
    it "should have a count method" do
      Perambulate::Designations.respond_to?(:count).should be_true
    end

    it "should be the same as the number of designations" do
      Perambulate::Designations.count.should eq Perambulate::Designations.send(:parselist).length
     end
  end

  context "by default" do

    it "should have a comma and space list of designations" do
      Perambulate::Designations.names_for_all.should eql(
          "Alley, Avenue, Circle, Close, Court, Crescent, Drive, Esplanade, Fairway, Lane, Place, Parade, Park, Road, Street, Terrace, Way"
                                                    )
    end
  end

  describe "#new" do

    it "should add the new designation to the parselist" do
      expect{
        Perambulate::Designations.add({
          :name => "Divide",
          :short_name => "Dv"
          })}.should change{Perambulate::Designations.count}.by(1)
    end
  end
end
