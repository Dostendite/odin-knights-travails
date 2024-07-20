require_relative "square"
require_relative "knight"

class Board
  attr_reader :knight, :squares, :moves, :adjacency_list

  def initialize(knight_x = 3, knight_y = 3)
    @knight = Knight.new("Sleipnir", knight_x, knight_y)
    @squares = generate_board
    @moves = generate_moves
    @adjacency_list = generate_adjacency_list
  end

  def generate_board
    board_squares = []

    last_color = "white"
    (0..7).each do |x|
      (0..7).each do |y|
        unless x.between?(1, 7) && y.zero?
          last_color = last_color == "black" ? "white" : "black"
        end
        square = Square.new(x, y, last_color)
        board_squares << square
      end
    end
    board_squares
  end

  def to_s
    ret_str = ""
    new_square = ""
    @squares.each_with_index do |square, idx|
      new_square = "#{square} ".black if square.color == "black"
      new_square = "#{square} ".white if square.color == "white"
      new_square = "[ K ] ".yellow if square.x == knight.x && square.y == knight.y

      ret_str += new_square
      ret_str += "\n" if ((idx + 1) % 8).zero?
    end
    ret_str
  end

  def valid_square?(square_x, square_y)
    return false if square_x.negative? || square_y.negative?
    return false if square_x > 7 || square_y > 7

    true
  end

  def generate_moves
    recipe = [1, 2, -1, -2]
    moves = []

    recipe.each do |num|
      recipe.each do |ber|
        next if num.abs == ber.abs

        moves << [num, ber]
      end
    end
    moves
  end

  def matrix_sum(square_x, square_y, move_x, move_y)
    result_x = square_x + move_x
    result_y = square_y + move_y

    [result_x, result_y]
  end

  def generate_possible_moves(square)
    possible_moves = []

    @moves.each do |move|
      potential_move = matrix_sum(square.x, square.y, move[0], move[1])
      possible_moves << potential_move if valid_square?(potential_move[0], potential_move[1])
    end
    possible_moves
  end

  def generate_adjacency_list
    adjacency_list = []

    @squares.each do |square|
      possible_moves = generate_possible_moves(square)
      adjacency_list << possible_moves
    end
    adjacency_list
  end

  def calculate_move; end
end