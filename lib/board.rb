require_relative "square"

class Board
  attr_reader :squares

  def initialize
    @squares = generate_board
  end

  def generate_board
    board_squares = []
    (0..7).each do |x|
      (0..7).each do |y|
        square = Square.new(x, y)
        board_squares << square
      end
    end
    board_squares
  end

  def to_s
    ret_str = ""
    @squares.each_with_index do |square, idx|
      square = square.to_s
      ret_str += "#{square} "
      ret_str += "\n" if ((idx + 1) % 8).zero?
    end
    ret_str
  end
end