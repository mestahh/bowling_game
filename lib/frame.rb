class Frame
  attr_reader :score
  
  def initialize
    @throw_counter = 0
    @score = 0
  end

  def throw score
    @score += score
    @throw_counter += 1
  end

  def complete?
    
    if @throw_counter == 2 || strike?
      return true
    end
    
    false
  end
  
  def strike?
    @throw_counter == 1 && @score == 10
  end
end