class BowlingGame
  def initialize
    @frames = []
    @frames << Frame.new
  end

  def roll score
    
	if ended?
      raise "Game ended."
    end
    
    frame = get_current_frame
	frame.roll score
  end

  def frame_score frame_index
    @frames[frame_index].score
  end

  def score
    sum_of_scores = 0
	
    @frames.each_index do |index|

      frame = @frames[index]
      sum_of_scores += frame.score
      
      if frame.strike? && not_last_frame(index)
        sum_of_scores +=  next_roll_score(index) + second_next_roll_score(index)
      elsif frame.spare?
        sum_of_scores +=  next_roll_score(index)
      end
      
    end
    sum_of_scores
  end

  private

  def get_current_frame
	
	if @frames.last.complete?
      frame = Frame.new
      @frames << frame
	  frame
    else
      @frames.last
    end
  end
  
  def next_roll_score index
    @frames[index+1].first_roll
  end

  def second_next_roll_score index
    if @frames[index + 1].strike?
      @frames[index + 2].first_roll
    else
      @frames[index + 1].second_roll
    end
  end
  
  def not_last_frame index
    index != 9
  end
  
  def ended?
    last_frame = @frames[9]
    if @frames.size == 10 && (last_frame.complete? && !last_frame.strike?)
      return true
    end
    false
  end

end