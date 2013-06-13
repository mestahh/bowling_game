class Frame
  
  def initialize
    @rolls = []
  end

  def roll score
    @rolls << score
  end

  def complete?
    @rolls.size == 2 || strike?
  end

  def strike?
    @rolls.size == 1 && @rolls[0] == 10
  end

  def first_roll
    @rolls[0]
  end

  def second_roll
    @rolls[1]
  end

  def score
    if @rolls.size == 1
      return @rolls[0]
    end
    if @rolls.size == 2
      return @rolls[0] + @rolls[1]
    end
    return 0
  end

  def spare?
    score == 10 && @rolls.size == 2
  end
end