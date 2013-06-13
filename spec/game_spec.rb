require 'support/spec_helper'

describe BowlingGame do

  before :each do
    @game = BowlingGame.new
  end

  it "returns zero if there was only one roll with zero pins hit" do
    @game.roll 0
    @game.score.should eq(0)
  end

  it "returns 5 if there was only one roll with 5 pins hit" do
    @game.roll 5
    @game.score.should eq(5)
  end

  it "should return 0 if there were no rolls at all" do
    @game.score.should eq(0)
  end

  it "should return the sum of 2 rolls" do
    @game.roll 4
    @game.roll 5
    @game.score.should eq(9)
  end

  it "should return the sum of 4 rolls" do
    roll_more 4, 4
    @game.score.should eq(16)
  end

  it "should return the score of the first frame" do
    @game.roll 4
    @game.roll 5
    @game.frame_score(0).should eq(9)
  end

  it "should return the score of the second frame" do
    @game.roll 4
    @game.roll 5
    @game.roll 4
    @game.roll 2
    @game.frame_score(1).should eq(6)
  end

  it "counts the next 2 rolls twice if the previous was a strike" do
    roll_strike
    @game.roll 4
    @game.roll 3
    @game.score.should eq(24)
  end
  
  it "scores 47 after two strikes and a 3 and 7 pin hits " do
    roll_strike
    roll_strike
    @game.roll 3
    @game.roll 4
    @game.score.should eq(47)
  end

  it "can have 10 frames" do
    roll_more 20, 1
    @game.score.should eq(20)
  end
  
  it "counts the next roll once again after a spare" do
    roll_spare
    @game.roll 4
    @game.score.should eq(18)
  end

  it "ends the game after 10 frames" do
    roll_more 20, 1

    expect { @game.roll 3 }.to raise_error("Game ended.") 
  
  end

  it "add two extra balls at the end if the 10th frame was a strike" do
    roll_more 18, 1
    roll_strike

    @game.roll 1
    @game.roll 1
    
    @game.score.should eq(30)
  end
  
  it "can count a turkeys pinfall" do
    roll_more_strikes 3
    @game.roll 0
    @game.roll 9
    
    @game.score.should eq(78)
  end
  
  private 
  
  def roll_strike
	@game.roll 10
  end
  
  def roll_more(number,pins)
	number.times do 
		@game.roll pins
	end
  end
  
  def roll_spare
	@game.roll 5
	@game.roll 5
  end
  
  def roll_more_strikes number
	number.times  do
		roll_strike
	end
  end
end