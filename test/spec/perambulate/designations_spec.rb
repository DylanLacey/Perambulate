require "test/spec/spec_helper"

describe "Designations" do

  context "by default" do

    it "should have a comma & space list of designations" do
      Perambulate::Designations.names_for_all.should eql(
          "Alley, Avenue, Circle, Close, Court, Crescent, Drive, Esplanade, Fairway, Lane, Place, Parade, Park, Street, Terrace, Way"
                                                    )
    end
  end
end