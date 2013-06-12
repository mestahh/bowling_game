require 'support/spec_helper'

describe Frame do
  
  before :each do
    @frame = Frame.new
  end
  
  it "stores the result of a throw" do
    @frame.throw 6
    @frame.score.should eq(6)
  end
  
  it "stores the sum of both scores" do
    @frame.throw 2
    @frame.throw 5
    @frame.score.should eq(7)  
  end
  
  it "has an initial score of 0" do
    @frame.score.should eq(0)
  end
  
  it "is not complete if it has no throws" do
    @frame.complete?.should eq(false)  
  end
  
  it "is not complete if it has only one throw" do
    @frame.throw 5
    @frame.complete?.should eq(false)  
  end
  
  it "is complete if it has 2 throws" do
    @frame.throw 3
    @frame.throw 4
    @frame.complete?.should eq(true)
  end
  
  it "is complete if the first throw is a strike" do
    @frame.throw 10
    @frame.complete?.should eq(true)
  end
  
  it "knows if it is a strike" do
    @frame.throw 10
    @frame.strike?.should eq(true)
  end
  
  it "is not a strike if it has 2 throws and the sum of them is 10" do
    @frame.throw 4
    @frame.throw 6
    @frame.strike?.should eq(false)
  end
 end
