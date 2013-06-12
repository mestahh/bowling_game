class BowlingGame
 
  
  def initialize
    @score = 0
    @frames = []
    @frames << Frame.new
  end
  
  def throw score
    if @frames.last.complete?
      new_frame = Frame.new
      new_frame.throw score
      @frames << new_frame
    else 
      @frames.last.throw score
    end
  end
  
  def frame_score frame_index
    @frames[frame_index].score
  end
  
  def score
    sum_of_scores = 0
    previous_was_strike = false
    
    @frames.each do |frame|
      
      frame_score = frame.score
      if previous_was_strike
        frame_score = frame.score * 2
      end
   
      if frame.strike?
        previous_was_strike = true
      else
        previous_was_strike = false
      end
      
      sum_of_scores += frame_score
    end
    return sum_of_scores
  end

  
end