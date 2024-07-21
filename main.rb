require "colorize"
require_relative "lib/square"
require_relative "lib/board"

board = Board.new

puts "~~~~~~~~ KNIGHT'S TRAVAILS ~~~~~~~~~"
puts "Printing board..."
puts board
puts

puts "What's the shortest route from [0, 0] to [4, 7]?"
puts

puts board
puts
board.find_route([0, 0], [4 , 7])
puts

puts "What about [7, 7] to [0, 0]?"
puts

puts board
puts
board.find_route([7, 7], [0, 0])
puts

puts "Lastly, let's see about [3, 3] to [0, 0]"
puts

puts board
puts
board.find_route([3, 3], [0, 0])