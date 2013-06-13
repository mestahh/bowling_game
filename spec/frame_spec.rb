require 'support/spec_helper'

describe Frame do

  before :each do
    @frame = Frame.new
  end

  it "stores the result of a roll" do
    @frame.roll 6
    @frame.score.should eq(6)
  end

  it "stores the sum of both scores" do
    @frame.roll 2
    @frame.roll 5
    @frame.score.should eq(7)
  end

  it "has an initial score of 0" do
    @frame.score.should eq(0)
  end

  it "is not complete if it has no rolls" do
    @frame.complete?.should eq(false)
  end

  it "is not complete if it has only one roll" do
    @frame.roll 5
    @frame.complete?.should eq(false)
  end

  it "is complete if it has 2 rolls" do
    @frame.roll 3
    @frame.roll 4
    @frame.complete?.should eq(true)
  end

  it "is complete if the first roll is a strike" do
    @frame.roll 10
    @frame.complete?.should eq(true)
  end

  it "knows if it is a strike" do
    @frame.roll 10
    @frame.strike?.should eq(true)
  end

  it "is not a strike if it has 2 rolls and the sum of them is 10" do
    @frame.roll 4
    @frame.roll 6
    @frame.strike?.should eq(false)
  end

  it "returns the first roll score" do
    @frame.roll 4
    @frame.roll 5
    @frame.first_roll.should eq(4)
  end

  it "returns the second roll score" do
    @frame.roll 4
    @frame.roll 5
    @frame.second_roll.should eq(5)
  end
  
  it "knows if it is a spare" do
    @frame.roll 4
    @frame.roll 6
    @frame.spare?.should eq(true)
  end
  
  it "knows that a strike is not a spare" do
    @frame.roll 10
    @frame.spare?.should eq(false)
  end
end
