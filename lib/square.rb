class Square
  attr_accessor :color
  attr_reader :x, :y

  def initialize(x, y, color)
    @x = x
    @y = y
    @color = color
  end

  def to_s
    "[#{x},#{y}]"
  end
end