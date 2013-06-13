require 'support/spec_helper'

describe BowlingGame do

  before :each do
    @game = BowlingGame.new
  end

  it "returns zero if there was only one throw with zero pins hit" do
    @game.throw 0
    @game.score.should eq(0)
  end

  it "returns 5 if there was only one throw with 5 pins hit" do

    @game.throw 5
    @game.score.should eq(5)
  end

  it "should return 0 if there were no throws at all" do
    @game.score.should eq(0)
  end

  it "should return the sum of 2 throws" do
    @game.throw 4
    @game.throw 5
    @game.score.should eq(9)
  end

  it "should return the sum of 4 throws" do
    @game.throw 4
    @game.throw 5
    @game.throw 4
    @game.throw 5
    @game.score.should eq(18)
  end

  it "should return the score of the first frame" do
    @game.throw 4
    @game.throw 5
    @game.frame_score(0).should eq(9)
  end

  it "should return the score of the second frame" do
    @game.throw 4
    @game.throw 5
    @game.throw 8
    @game.throw 2
    @game.frame_score(1).should eq(10)
  end

  it "counts the next 2 throws twice if the previous was a strike" do
    @game.throw 10
    @game.throw 4
    @game.throw 3
    @game.score.should eq(24)
  end
  
  it "scores 47 after two strikes and a 3 and 7 pin hits " do
    @game.throw 10
    @game.throw 10
    @game.throw 3
    @game.throw 4
    @game.score.should eq(47)
  end

  it "can have 10 frames" do
    @game.throw 4
    @game.throw 3

    @game.throw 4
    @game.throw 3

    @game.throw 4
    @game.throw 3

    @game.throw 4
    @game.throw 3

    @game.throw 4
    @game.throw 3

    @game.throw 4
    @game.throw 3

    @game.throw 4
    @game.throw 3

    @game.throw 4
    @game.throw 3

    @game.throw 4
    @game.throw 3

    @game.throw 4
    @game.throw 3

    @game.score.should eq(70)
  end
  
  it "counts the next throw once again after a spare" do
    @game.throw 4
    @game.throw 6

    @game.throw 4
    @game.score.should eq(18)
  end

  it "ends the game after 10 frames" do
    @game.throw 4
    @game.throw 3

    @game.throw 4
    @game.throw 3

    @game.throw 4
    @game.throw 3

    @game.throw 4
    @game.throw 3

    @game.throw 4
    @game.throw 3

    @game.throw 4
    @game.throw 3

    @game.throw 4
    @game.throw 3

    @game.throw 4
    @game.throw 3

    @game.throw 4
    @game.throw 3

    @game.throw 4
    @game.throw 3

    expect { @game.throw 3 }.to raise_error("Game ended.") 
  
  end

  it "add two extra balls at the end if the 10th frame was a strike" do
    @game.throw 4
    @game.throw 3

    @game.throw 4
    @game.throw 3

    @game.throw 4
    @game.throw 3

    @game.throw 4
    @game.throw 3

    @game.throw 4
    @game.throw 3

    @game.throw 4
    @game.throw 3

    @game.throw 4
    @game.throw 3

    @game.throw 4
    @game.throw 3

    @game.throw 4
    @game.throw 3

    @game.throw 10

    @game.throw 5
    @game.throw 3
    
    @game.score.should eq(81)
  end
  
  it "can count a turkeys pinfall" do
    @game.throw 10
    @game.throw 10
    @game.throw 10
    @game.throw 0
    @game.throw 9
    
    @game.score.should eq(78)
    
  end
end