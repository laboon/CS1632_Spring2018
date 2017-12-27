class Car

  @color = nil
  
  def initialize color
    @color = color
  end

  def move
    rand(10) + 1
  end
  
  def to_s
    @color.to_s + " car"
  end
  
end
