class BowlingGame
  def initialize
    @score = 0
    @frames = []
    @frames << Frame.new
  end

  def throw score
    if ended?
      raise "Game ended."
    end
    
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

    @frames.each_index do |index|

      frame = @frames[index]
      sum_of_scores += frame.score
      
      if frame.strike? && not_last_frame(index)
        sum_of_scores +=  next_throw_score(index) + second_next_throw_score(index)
      elsif frame.spare?
        sum_of_scores +=  next_throw_score(index)
      end
      
    end
    return sum_of_scores
  end

  private

  def next_throw_score index
    @frames[index+1].first_throw
  end

  def second_next_throw_score index
    if @frames[index + 1].strike?
      @frames[index + 2].first_throw
    else
      @frames[index + 1].second_throw
    end
  end
  
  private
  
  def not_last_frame index
    index != 9
  end
  
  def ended?
    if @frames.size == 10 && (@frames[9].complete? && !@frames[9].strike?)
      return true
    end
    false
  end

end