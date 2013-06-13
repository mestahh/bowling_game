class Frame
  attr_reader :score
  
  def initialize
    @throws = []
  end

  def throw score
    @throws << score
  end

  def complete?
    if @throws.size == 2 || strike?
      return true
    end
    
    false
  end
  
  def strike?
    @throws.size == 1 && @throws[0] == 10
  end
  
  def first_throw
    @throws[0]
  end
  
  def second_throw
    @throws[1]
  end
  
  def score
    if @throws.size == 1
      return @throws[0]
    end
    if @throws.size == 2
      return @throws[0] + @throws[1]
    end
    return 0
  end
  
  def spare?
    if score == 10 && @throws.size == 2
      return true
    end
    false
  end
end