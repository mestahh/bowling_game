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
  
  it "counts the score of the frame twice if the previous frame was a strike" do
    @game.throw 10
    @game.throw 4
    @game.throw 3
    @game.score.should eq(24)
  end
  
end