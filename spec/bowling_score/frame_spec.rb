
require 'spec_helper'
describe Frame do
  let(:frame) { Frame.new }
  context "#score" do
    it "with 0 throw" do
      frame.score.should == 0
    end
    it "with 1 throw" do
      frame.add 5
      frame.score.should == 5
    end

  end
end
